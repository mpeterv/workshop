return
  function(self, node)
    return
      {
        type = 'while_block',
        condition = self:process_node(node[1]),
        body = self:process_node(node[2]),
      }
  end