return
  function(self)
    self.indent_chunk = '  '
    self.printer.indent_chunk = self.indent_chunk
    self.printer:init()
    self.state_keeper:init()
    self.right_margin = 70
  end
