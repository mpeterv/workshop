return
  function(self, node)
    self:process_block_oneline('for', nil, node.names)
    self:process_block_oneline('in', nil, node.expr_list)
    self:process_block_multiline('do', 'end', node.body)
  end