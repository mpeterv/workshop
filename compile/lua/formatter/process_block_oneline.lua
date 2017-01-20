return
  function(self, prefix, node, postfix, alternate_handler)
    local printer = self.printer
    if prefix then
      printer:add_text(prefix)
    end
    local result = self:process_block(node, alternate_handler)
    if postfix then
      printer:add_text(postfix)
    end
    return result
  end
