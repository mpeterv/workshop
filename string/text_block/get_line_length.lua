return
  function(self, line_num)
    local result
    if not self.lines[line_num] then
      result = 0
    else
      local indent_chunk_len = utf8.len(self.indent_chunk)
      result =
        indent_chunk_len * self.line_indents[line_num] +
        (
          utf8.len(self.lines[line_num]) or
          string.len(self.lines[line_num])
        )
    end
    return result
  end
