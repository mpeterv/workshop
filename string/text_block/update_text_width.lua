return
  function(self, line_num)
    line_num = line_num or #self.lines
    local cur_line_len = self:get_line_length(line_num)
    if (cur_line_len > self.text_width) then
      self.text_width = cur_line_len
    end
  end
