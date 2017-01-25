local oneliner =
  function(self, node)
    self.printer:add_text('[')
    self:process_node(node.expr)
    self.printer:add_text(']')
  end

local multiliner =
  function(self, node)
    self.printer:add_text('[')
    self.printer:close_line()
    self.printer:inc_indent()
    self:process_node(node.expr)
    self.printer:dec_indent()
    self.printer:request_clean_line()
    self.printer:add_text(']')
  end

return
  function(self, node)
    self:variate(node, oneliner, multiliner)
  end
