function Div(el)
    if el.classes[1] == "success" or el.classes[1] == "tip" then
      classes = (el.classes[1]:gsub("^%l", string.upper))
      -- insert element in front
      table.insert(
        el.content, 1,
        pandoc.RawBlock("latex", "\\begin{Success}{\\color{success-title}\\setmainfont{Roboto}\\textbf{* "..classes.."}} \\newline"))
      -- insert element at the back
      table.insert(
        el.content,
        pandoc.RawBlock("latex", "\\end{Success}"))
    elseif el.classes[1] == "info" or el.classes[1] == "note" then
      classes = (el.classes[1]:gsub("^%l", string.upper))
      -- insert element in front
      table.insert(
        el.content, 1,
        pandoc.RawBlock("latex", "\\begin{Info}{\\color{info-title}\\setmainfont{Roboto}\\textbf{* "..classes.."}} \\newline"))
      -- insert element at the back
      table.insert(
        el.content,
        pandoc.RawBlock("latex", "\\end{Info}"))
    elseif el.classes[1] == "important" then
      classes = (el.classes[1]:gsub("^%l", string.upper))
      -- insert element in front
      table.insert(
        el.content, 1,
        pandoc.RawBlock("latex", "\\begin{Important}{\\color{danger-title}\\setmainfont{Roboto}\\textbf{* "..classes.."}} \\newline"))
      -- insert element at the back
      table.insert(
        el.content,
        pandoc.RawBlock("latex", "\\end{Important}"))
    elseif el.classes[1] == "restricted" then
      classes = (el.classes[1]:gsub("^%l", string.upper))
      -- insert element in front
      table.insert(
        el.content, 1,
        pandoc.RawBlock("latex", "\\begin{Restricted}{\\color{restricted-title}\\setmainfont{Roboto}\\textbf{* "..classes.."}} \\newline"))
      -- insert element at the back
      table.insert(
        el.content,
        pandoc.RawBlock("latex", "\\end{Restricted}"))
    elseif el.classes[1] == "danger" or el.classes[1] == "warning" then
      classes = (el.classes[1]:gsub("^%l", string.upper))
      -- insert element in front
      table.insert(
        el.content, 1,
        pandoc.RawBlock("latex", "\\begin{Danger}{\\color{danger-title}\\setmainfont{Roboto}\\textbf{* "..classes.."}} \\newline"))
      -- insert element at the back
      table.insert(
        el.content,
        pandoc.RawBlock("latex", "\\end{Danger}"))
    end
    return el
  end
