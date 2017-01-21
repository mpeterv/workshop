return
  function(self, node)
    self:process_block_oneline('while', nil, node.condition)
    self:process_block_multiline('do', 'end', node.body)
  end
