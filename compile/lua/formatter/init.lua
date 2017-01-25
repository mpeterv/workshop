return
  function(self)
    self.indent_chunk = '  '
    self.printer.indent_chunk = self.indent_chunk
    self.printer:init()
    self.right_margin = 69
    self.is_multiline_allowed = true
  end
