local header_oneline =
  function(self, node)
    local printer = self.printer
    printer:add_text('for ')
    self:process_node(node.names)
    printer:add_text(' in ')
    self:process_node(node.expr_list)
    printer:add_text(' do')
  end

local in_part_oneline =
  function(self, node)
    self.printer:add_text(' in ')
    self:process_node(node.expr_list)
  end

local in_part_multiline =
  function(self, node)
    self.printer:add_to_prev_text(' in')

    self.printer:request_clean_line()
    self:process_block(node.expr_list)
  end

local header_multiline =
  function(self, node)
    local printer = self.printer
    printer:add_text('for')

    printer:request_clean_line()
    printer:inc_indent()
    self:process_node(node.names)
    self:variate(node, in_part_oneline, in_part_multiline)
    printer:dec_indent()

    printer:request_clean_line()
    printer:add_text('do')
  end

return
  function(self, node)
    local printer = self.printer

    printer:request_clean_line()
    self:variate(node, header_oneline, header_multiline)

    printer:request_clean_line()
    self:process_block(node.body)

    printer:request_clean_line()
    printer:add_text('end')
  end
