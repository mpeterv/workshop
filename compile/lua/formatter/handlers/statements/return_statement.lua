return
  function(self, node)
    self.printer:add_text('return ')
    self:process_node(node.expr_list)
  end
