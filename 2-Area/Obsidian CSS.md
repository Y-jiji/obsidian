---
tags:
  - 𝔗-obsidian
---
# Minimize Distraction

```css
/* Remove redundant widgets (when working on desktop) */
:not(.is-mobile)
:where(
  .metadata-properties-heading,
  .sidebar-toggle-button,
  .workspace-ribbon
) {
  display: none
}
.workspace-leaf-content[data-type=kanban]>.view-header {
  display: none !important;
}
/* Remove redundant decorations & Unify Colors */
.workspace-tab-header-container *::before {
  display: none
}
.workspace-tab-header-container *::after {
  display: none
}
.workspace-tab-header-container, .workspace-tab-header-container-inner {
  padding-left: 0.5em !important;
}
.workspace-tab-header-container, .workspace-tab-header-inner, .workspace-tab-header-container-inner, .workspace-leaf {
  background-color: var(--color-base-00) !important;
  border: none !important;
}
.titlebar-button {
  background-color: var(--color-base-00);
}
.workspace-tab-header {
  box-shadow: none !important;
  margin-left: 4px !important;
  margin-right: 4px !important;
}
/* Replace with new decoration */
.workspace-tab-header-inner {
  border-top: 1.5px solid var(--color-base-100) !important;
  border-radius: 0px !important;
}
.cm-formatting-quote {
  color: transparent !important;
}
```

# Agreeable Heading Size

```css
/* Distinguish article title from H1 */
.inline-title {
  font-size: 1.8em !important;
  text-align: center;
  font-style: normal;
  font-weight: bolder;
}
/* Make headings smaller */
body {
  --h1-size : 1.6em !important;
  --h2-size : 1.4em !important;
  --h3-size : 1.2em !important;
  --h4-size : 1.1em !important;
  --h5-size : 1.1em !important;
  --h6-size : 1.1em !important;
  --h1-font: "Libertinus Serif";
  --h2-font: "Libertinus Serif";
  --h3-font: "Libertinus Serif";
  --h4-font: "Libertinus Serif";
  --h5-font: "Libertinus Serif";
  --h6-font: "Libertinus Serif";
}
```

# Centering Images

```css
.image-embed {
  text-align: centered;
}
```