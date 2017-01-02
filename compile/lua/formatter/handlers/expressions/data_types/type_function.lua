return
  function(self, node)
    self.printer:emit('function')
    self:process_node(node.params)
    self:process_block_multiline(nil, 'end', node.body)
  end
