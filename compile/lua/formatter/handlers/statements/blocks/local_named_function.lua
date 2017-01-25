return
  function(self, node)
    local printer = self.printer

    printer:request_empty_line()
    printer:add_text('local function ')
    self:process_node(node.dotted_name)
    self:process_node(node.params)

    printer:request_clean_line()
    self:process_block_multiline(nil, node.body, 'end')

    printer:request_empty_line()
  end
