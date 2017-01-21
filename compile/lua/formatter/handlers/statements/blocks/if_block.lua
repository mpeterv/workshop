local multiline_if =
  {
    function(self, node)
      self.printer:add_text('if')
      self.printer:request_clean_line()
      self:process_node(node)
      self.printer:request_clean_line()
      self.printer:add_text('then')
    end,
    is_multiline = true,
  }

local oneline_if =
  {
    function(self, node)
      self.printer:add_text('if ')
      self:process_node(node)
      self.printer:add_text(' then')
    end,
    is_multiline = false,
  }

local multiline_elseif =
  {
    function(self, node)
      self.printer:add_text('elseif')
      self.printer:request_clean_line()
      self:process_node(node)
      self.printer:request_clean_line()
      self.printer:add_text('then')
    end,
    is_multiline = true,
  }

local oneline_elseif =
  {
    function(self, node)
      self.printer:add_text('elseif ')
      self:process_node(node)
      self.printer:add_text(' then')
    end,
    is_multiline = false,
  }

return
  function(self, node)
    local printer = self.printer

    printer:request_clean_line()
    self:variate({multiline_if, oneline_if}, node.if_part.condition)
    printer:request_clean_line()
    printer:inc_indent()
    self:process_node(node.if_part.body)
    printer:dec_indent()

    if node.elseif_parts then
      for i = 1, #node.elseif_parts do
        printer:request_clean_line()
        self:variate(
          {multiline_elseif, oneline_elseif},
          node.elseif_parts[i].condition
        )
        printer:request_clean_line()
        printer:inc_indent()
        self:process_node(node.elseif_parts[i].body)
        printer:dec_indent()
      end
    end

    if node.else_part then
      printer:request_clean_line()
      printer:add_text('else')
      printer:request_clean_line()
      printer:inc_indent()
      self:process_node(node.else_part.body)
      printer:dec_indent()
    end

    printer:request_clean_line()
    self.printer:add_text('end')
  end
