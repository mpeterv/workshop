local trim_tail_spaces = request('^.^.^.^.string.trim_tail_spaces')

return
  function(self)
    local cur_line = self.text.lines[#self.text.lines]
    cur_line = trim_tail_spaces(cur_line)
    self.text.lines[#self.text.lines] = cur_line
    self.text:add_line()
    self:update_indent()
  end
