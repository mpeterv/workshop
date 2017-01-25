local oneline_delimiter = ', '

local oneliner =
  function(self, node)
    self:process_list(node, oneline_delimiter)
  end

local multiline_delimiter =
  function(self)
    self.printer:add_to_prev_text(',')
    self.printer:request_clean_line()
  end

local multiliner =
  function(self, node)
    self.printer:request_clean_line()
    self:process_list_variative(node, oneline_delimiter, multiline_delimiter)
  end

return
  function(self, node)
    self:variate(node, oneliner, multiliner)
  end
