local oneliner =
  function(self, node)
    self:process_block_oneline('if', 'then', node.if_part.condition)
    self:process_block_oneline(nil, nil, node.if_part.body)

    if node.elseif_parts then
      for i = 1, #node.elseif_parts do
        local part = node.elseif_parts[i]
        self:process_block_oneline('elseif', 'then', part.condition)
        self:process_block_oneline(nil, nil, part.body)
      end
    end

    if node.else_part then
      self:process_block_oneline('else', nil, node.else_part.body)
    end

    self.printer:emit('end')
  end

local multiliner =
  function(self, node)
    self:process_block_oneline('if', 'then', node.if_part.condition)
    self:process_block_multiline(nil, nil, node.if_part.body)

    if node.elseif_parts then
      for i = 1, #node.elseif_parts do
        local part = node.elseif_parts[i]
        self:process_block_oneline('elseif', 'then', part.condition)
        self:process_block_multiline(nil, nil, part.body)
      end
    end

    if node.else_part then
      self:process_block_multiline('else', nil, node.else_part.body)
    end

    self.printer:emit('end')
  end

local variants =
  {
    {handle = multiliner, is_multiline = true},
    {handle = oneliner},
  }
return
  function(self, node)
    self:variate(variants, node)
  end
