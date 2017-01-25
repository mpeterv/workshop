local oneline_delimiter = ', '

local oneliner =
  function(self, node)
    self.printer:add_text('(')
    self:process_list(node, oneline_delimiter)
    self.printer:add_text(')')
  end

local multiline_delimiter =
  function(self)
    self.printer:add_to_prev_text(',')
    self.printer:request_clean_line()
  end

local multiliner =
  function(self, node)
    self.printer:add_text('(')
    self.printer:close_line()
    self.printer:inc_indent()
    self:process_list_variative(node, oneline_delimiter, multiline_delimiter)
    self.printer:dec_indent()
    self.printer:request_clean_line()
    self.printer:add_text(')')
  end

return
  function(self, node)
    if (#node == 0) then
      self.printer:add_text('()')
    else
      self:variate(node, oneliner, multiliner)
    end
  end
