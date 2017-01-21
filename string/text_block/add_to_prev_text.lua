return
  function(self, s)
    assert_string(s)
    if self:on_clean_line() then
      local line_num = #self.lines - 1
      if (line_num <= 0) then
        error('add_to_prev_text(): There is no previous text.')
      end
      self.lines[line_num] = self.lines[line_num] .. s
      self:update_text_width(line_num)
    else
      self:add_text(s)
    end
  end
