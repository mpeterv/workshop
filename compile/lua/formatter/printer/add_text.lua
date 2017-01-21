local trim_head_spaces = request('^.^.^.^.string.trim_head_spaces')

return
  function(self, s)
    if self:on_clean_line() then
      s = trim_head_spaces(s)
    end
    self.text:add_text(s)
  end
