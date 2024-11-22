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