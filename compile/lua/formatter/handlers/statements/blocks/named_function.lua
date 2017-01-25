return
  function(self, node)
    local printer = self.printer

    printer:request_empty_line()
    printer:add_text('function ')
    self:process_node(node.dotted_name)
    if node.colon_name then
      self:process_node(node.colon_name)
    end
    self:process_node(node.params)

    printer:request_clean_line()
    self:process_block_multiline(nil, node.body, 'end')

    printer:request_empty_line()
  end
