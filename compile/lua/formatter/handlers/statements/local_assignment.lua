return
  function(self, node)
    self.printer:add_text('local ')
    self:process_node(node.name_list)
    if node.val_list then
      self.printer:add_text(' = ')
      self:process_node(node.val_list)
    end
  end
