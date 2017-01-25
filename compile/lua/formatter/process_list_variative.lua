return
  function(self, node, oneline_delimiter, multiline_delimiter, apply_tail_delimiter)
    if (#node > 0) then
      local oneliner =
        function(self, node)
          self:process_list(node, oneline_delimiter, apply_tail_delimiter)
        end
      local multiliner =
        function(self, node)
          self:process_list(node, multiline_delimiter, apply_tail_delimiter)
        end
      self:variate(node, oneliner, multiliner)
    end
  end
