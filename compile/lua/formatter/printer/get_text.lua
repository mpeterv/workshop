return
  function(self)
    local result = {}
    for i = 1, #self.text.lines do
      result[i] =
        -- ('[%s]'):format(self.line_indents[i]) ..
        self:get_line(i)
    end
    result = table.concat(result, '\n')
    return result
  end
