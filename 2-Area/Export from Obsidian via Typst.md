---
tags:
  - 𝔗-obsidian
---

# Bibliography Management

Use shell command to append bibliography to a `bibliography.bib` under `2-Akashic` . 

# Cleaning

To purge PDF files, we use the following script: 

```shell
IFS=$'\n'
for x in $(find $(pwd) | grep -P ".pdf$")
do
    echo "remove $x" 1>&2
    rm -rf "$x"
done
```

# Bug in Pandoc

In pandoc, I found a very weird bug. If a line ends with space, then conversion from markdown lists to typst lists works fine. However, if not, the lists will be weirdly flattened. I list current version information for future reference. 

```
pandoc 3.1.11.1
Features: +server +lua
Scripting engine: Lua 5.4
```

# Lua Filter

The following lua filter helps convert math and codeblocks in markdown to typst. 
It also handles citation and other kind of hyperlinks. 
- Citation: convert to typst citation
- Link to other files: treat as plain text
- Link to current file: convert to typst reference

```lua
function Math(el)
  -- Convert the math element to a raw block in Typst format
  return pandoc.RawInline("typst", "$" .. el.text .. "$")
end

function Link(el)
  -- Replace the link with just its text content
  if not el.target:match("^%#") then
    return el
  end
  el.target = el.target:gsub("^%#", ""):gsub("^%^", ""):lower():gsub(" ", "-")
  return pandoc.RawInline("typst", "#ref(<" .. el.target .. ">)")
end

function Inlines(el)
  -- Inline element
  if next(el) and el[#el].tag == "Str" and el[#el].text:match('^%^') then
    return pandoc.RawInline("typst", "<" .. el[#el].text:gsub("^%^", "") .. ">")
  end
  return el
end

function Cite(el)
  -- Convert each citation in the format {cite(key1, key2, ...)}
  local citation_keys = {}
  for _, citation in ipairs(el.citations) do
    table.insert(citation_keys, citation.id)
  end
  local typst_citation = "#cite(<" .. table.concat(citation_keys, ", ") .. ">)"
  return pandoc.RawInline("typst", typst_citation)
end

function HorizontalRule(el)
  -- Change horizontal rule to `#pagebreak()`
  return pandoc.RawBlock("typst", "#pagebreak()\n")
end

function CodeBlock(el)
  -- Convert typst codeblock to image-like stuff
  if el.classes[1] == nil then
    return pandoc.RawBlock("typst", "#figure(caption: [])[#align(center)[#block(width: 80%, stroke: none)[```" .. "\n" .. el.text .. "\n```]]]")
  elseif el.classes[1] == "typst" then
    return pandoc.RawBlock("typst", "#figure(caption: [])[#align(center)[#scale(x: 80%, y: 80%, reflow: true)[" .. el.text .. "\\\n\n]]]")
  else
    return pandoc.RawBlock("typst", "#figure(caption: [])[#align(center)[#block(width: 80%, stroke: none)[```" .. el.classes[1] .. "\n" .. el.text .. "\n```]]]")
  end
end
```

# Export PDF via Typst

```shell
# ------------------------- #
# Markdown via Typst to PDF #
# ------------------------- #

# Prepare File Names
FILE=$(echo '{{file_path:relative}}' | sed 's/\\//g')
NAME=$(echo '{{file_name}}' | sed 's/\\//g' | sed 's/.md$//g')
NAME_ESCAPED=$(echo ${NAME} | sed 's/@/\\@/g')
BIB="6-Asset/bibliography.bib"

# Convert Document to Typst via Pandoc
DOC=$(cat "${FILE}" | \
    tr '\n' '\r' | \
    sed 's/\r/    \r/g' | \
    tr '\r' '\n' | \
    pandoc \
    --from=markdown+wikilinks_title_after_pipe \
    --to=typst \
    --lua-filter=.obsidian/scripts/academic.lua \
    --wrap=none
)

# Add Typst Header
DOC="
#set page(paper: \"a4\")
#let foreground = black
#show bibliography: set heading(numbering: \"1  \")
#set heading(numbering: \"1.1.1  \")
#show heading: it => [
    #v(0.5em)
    #it
    #v(0.5em)
]
#align(center)[#rect(width: 80%, inset: 20pt)[#align(center)[
    #set text(size: 16pt)
    #strong[${NAME_ESCAPED}]
]]]
#align(center)[
   #set text(size: 10pt)
    #emph[Tianji Yang]
]
#let varnothing = \$text(font: \"Fira Sans\", nothing)\$
#show figure.caption.where(body: []): it => it.supplement + [ ] + context it.counter.display()

${DOC}

#bibliography(\"${BIB}\", style: \"ieee\")
"
# Pipe Content to Typst Compiler
echo "${DOC}" | typst compile - "${NAME}.pdf"
echo "${DOC}" > debug.typ
echo "Finish Exporting \"${NAME}.pdf\"" 1>&2
```

# Export Slides via Typst

```shell
# ---------------------------- #
# Markdown via Typst to Slides #
# ---------------------------- #

# Prepare File Names
FILE=$(echo '{{file_path:relative}}' | sed 's/\\//g')
NAME=$(echo '{{file_name}}' | sed 's/\\//g' | sed 's/.md$//g')
NAME_ESCAPED=$(echo ${NAME} | sed 's/@/\\@/g')
BIB="6-Asset/bibliography.bib"

# Convert Document to Typst via Pandoc
DOC=$(cat "${FILE}" | \
    tr '\n' '\r' | \
    sed 's/\r/    \r/g' | \
    tr '\r' '\n' | \
    pandoc \
    --from=markdown+wikilinks_title_after_pipe \
    --to=typst \
    --lua-filter=.obsidian/scripts/academic.lua \
    --wrap=none
)

# Add Typst Header
DOC="
// First Page
#set page(paper: \"presentation-16-9\")
#align(center + horizon)[#block(width: 80%, inset: 20pt)[#align(center)[
    #set text(size: 40pt)
    #line(length: 100%)
    #strong[${NAME_ESCAPED}]
    #line(length: 100%)
]]]
#align(center)[
   #set text(size: 20pt)
   #emph[Tianji Yang (tyang425\@gatech.edu)]
   #linebreak()
   #emph[Georgia Institute of Technology]
]

// Setup text size
#set text(size: 20pt)

// Disable Normal Level 1 Heading
#show heading: it => [
    #v(0.1em)
    #it
    #v(0.1em)
]
#show heading.where(level: 1): h => pagebreak()

#let varnothing = \$text(font: \"Fira Sans\", nothing)\$

// Allow Breaking Long Codeblocks
#show figure.caption.where(body: []): it => it.supplement + [ ] + context it.counter.display()
#show figure: set block(breakable: true)

// Setup page size & Level 1 Heading
#set page(
  margin: (
    top: 1.8em + 4em,
    bottom: 4em,
    left: 4em,
    right: 4em
  ),
  header: [
      #context {  
        let p = here().page()
        let h = query(selector(heading.where(level: 1)))
          .rev().find(x => x.location().page() <= p)
        if h != none {
            strong[#text(size: 1.8em)[#h.body]]
            v(0.5em)
        }
    }
  ]
)

${DOC}

#bibliography(\"${BIB}\", style: \"ieee\")
"

# Pipe Content to Typst Compiler
echo "${DOC}" | typst compile - "${NAME} (Slides).pdf"
echo "${DOC}" > debug.typ
echo "Finish Exporting \"${NAME} (Slides).pdf\"" 1>&2
evince --presentation "${NAME} (Slides).pdf"
```
