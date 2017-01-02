return
  function(self)
    self.text:init()
    self.indent = 0
    self.has_debt = false
    self.is_multiline_allowed = true
    self.on_clean_line = true
  end
