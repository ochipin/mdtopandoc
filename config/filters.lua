function Div(el)
    if el.classes[1] == "success" then
      -- insert element in front
      table.insert(
        el.content, 1,
        pandoc.RawBlock("latex", "\\begin{Success}"))
      -- insert element at the back
      table.insert(
        el.content,
        pandoc.RawBlock("latex", "\\end{Success}"))
    elseif el.classes[1] == "info" then
      -- insert element in front
      table.insert(
        el.content, 1,
        pandoc.RawBlock("latex", "\\begin{Info}"))
      -- insert element at the back
      table.insert(
        el.content,
        pandoc.RawBlock("latex", "\\end{Info}"))
    elseif el.classes[1] == "warning" then
        -- insert element in front
        table.insert(
          el.content, 1,
          pandoc.RawBlock("latex", "\\begin{Warning}"))
        -- insert element at the back
        table.insert(
          el.content,
          pandoc.RawBlock("latex", "\\end{Warning}"))
    elseif el.classes[1] == "danger" then
      -- insert element in front
      table.insert(
        el.content, 1,
        pandoc.RawBlock("latex", "\\begin{Danger}"))
      -- insert element at the back
      table.insert(
        el.content,
        pandoc.RawBlock("latex", "\\end{Danger}"))
    end
    return el
  end
