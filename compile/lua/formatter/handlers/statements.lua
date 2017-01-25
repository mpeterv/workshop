local multiliner =
  function(self, node)
    local printer = self.printer
    for i = 1, #node do
      self.printer:request_clean_line()
      self:process_node(node[i])
      self.printer:add_to_prev_text(';')
    end
  end

return
  function(self, node)
    self:variate(node, nil, multiliner)
  end
