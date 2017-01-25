return
  function(self, node, alternate_handler)
    self.printer:inc_indent()
    if alternate_handler then
      alternate_handler(self, node)
    else
      self:process_node(node)
    end
    self.printer:dec_indent()
  end
