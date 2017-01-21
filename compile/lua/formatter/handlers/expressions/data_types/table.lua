local oneliner =
  function(self, node)
    self.printer:add_text('{')
    for i = 1, #node do
      if (i > 1) then
        self.printer:add_text(', ')
      end
      local key, value = node[i].key, node[i].value
      if key then
        self:process_node(key)
        self.printer:add_text(' = ')
      end
      self:process_node(value)
    end
    self.printer:add_text('}')
  end

local multiliner =
  function(self, node)
    local printer = self.printer
    if (#node == 0) then
      printer:add_text('{}')
      return
    end
    printer:request_clean_line()
    printer:add_text('{')
    printer:close_line()
    printer:inc_indent()
    for i = 1, #node do
      local key, value = node[i].key, node[i].value
      if key then
        self:process_node(key)
        printer:add_text(' = ')
        self:process_node(value)
        printer:add_text(';')
        printer:close_line()
      else
        --[[
          Formally <value> is expression so it is represented
          with additional indent. It is OK when we have <key>
          but without <key> I don't like this additional indent.
          So indent is decreased by one before representing <value>
          when <key> is absent.
        ]]
        printer:dec_indent()
        self:process_node(value)
        printer:add_text(';')
        printer:close_line()
        printer:inc_indent()
      end
    end
    printer:dec_indent()
    printer:add_text('}')
  end

local variants =
  {
    {multiliner, is_multiline = true},
    oneliner,
  }

return
  function(self, node)
    self:variate(variants, node)
  end
