local multiliner =
  function(self, node)
    local printer = self.printer

    printer:request_clean_line()
    printer:add_text('function')
    self:process_node(node.params)

    printer:request_clean_line()
    self:process_block_multiline(nil, node.body, 'end')
  end

return
  function(self, node)
    self:variate(node, nil, multiliner)
  end
