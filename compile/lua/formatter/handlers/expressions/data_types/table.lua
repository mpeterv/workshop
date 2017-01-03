local oneliner =
  function(self, node)
    self.printer:emit('{')
    for i = 1, #node do
      if (i > 1) then
        self.printer:emit(', ')
      end
      local key, value = node[i].key, node[i].value
      if key then
        self:process_node(key)
        self.printer:emit(' = ')
      end
      self:process_node(value)
    end
    self.printer:emit('}')
  end

local multiliner =
  function(self, node)
    local printer = self.printer
    if (#node == 0) then
      printer:emit('{}')
      return
    end
    printer:emit('{')
    printer:emit_nl()
    printer:inc_indent()
    for i = 1, #node do
      local key, value = node[i].key, node[i].value
      if key then
        self:process_node(key)
        printer:emit(' = ')
      end
      self:process_node(value)
      printer:emit(';')
      printer:emit_nl()
    end
    printer:dec_indent()
    printer:emit('}')
  end

local variants =
  {
    {handle = multiliner, is_multiline = true},
    {handle = oneliner, is_multiline = false},
  }
return
  function(self, node)
    self:variate(variants, node)
  end
