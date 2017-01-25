local oneliner =
  function(self, node)
    local printer = self.printer
    printer:add_text('{')
    for i = 1, #node do
      if (i > 1) then
        printer:add_text(', ')
      end
      local key, value = node[i].key, node[i].value
      if key then
        self:process_node(key)
        printer:add_text(' = ')
      end
      self:process_node(value)
    end
    printer:add_text('}')
  end

local multiliner =
  function(self, node)
    local printer = self.printer

    printer:request_clean_line()
    printer:add_text('{')

    printer:inc_indent()
    for i = 1, #node do
      printer:request_clean_line()
      local key, value = node[i].key, node[i].value
      if key then
        self:process_node(key)
        printer:add_text(' = ')
        self:process_block(value)
        printer:add_to_prev_text(';')
      else
        self:process_node(value)
        printer:add_to_prev_text(';')
      end
    end
    printer:dec_indent()

    printer:request_clean_line()
    printer:add_text('}')
  end

return
  function(self, node)
    if (#node == 0) then
      self.printer:add_text('{}')
    else
      if (#node > self.right_margin // 2) then
        multiliner(self, node)
      else
        self:variate(node, oneliner, multiliner)
      end
    end
  end
