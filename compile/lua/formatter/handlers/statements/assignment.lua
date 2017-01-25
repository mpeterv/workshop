return
  function(self, node)
    self:process_node(node.dest_list)
    if node.val_list then
      self.printer:add_to_prev_text(' = ')
      self:process_block(node.val_list)
    end
  end
