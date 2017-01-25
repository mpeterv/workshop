return
  function(self, node, oneliner, multiliner)
    local default_representation, result_representation
    local has_succeeded = false

    local do_represent =
      function(representer, is_multiline)
        local trial_representation, has_failed =
          self:represent(representer, is_multiline, node)
        default_representation = trial_representation
        if
          not has_failed and
          self:representation_is_allowed(trial_representation)
        then
          result_representation = trial_representation
          has_succeeded = true
        end
        -- print(('?[\n%s\n] %s'):format(trial_representation:get_text(), has_failed))
      end

    local line_too_long =
      self.printer:get_line_length(#self.printer.lines) > self.right_margin

    if
      not line_too_long and
      oneliner
    then
      -- print('try oneliner')
      do_represent(oneliner, false)
    end
    if
      not result_representation and
      multiliner and
      self.is_multiline_allowed
    then
      -- print('try multiliner')
      do_represent(multiliner, true)
    end
    result_representation = result_representation or default_representation
    self.printer.has_failed_to_represent = not has_succeeded

    if result_representation then
      -- print(('[\n%s\n] is_ok: %s'):format(result_representation:get_text(), has_succeeded))

      self.printer.lines[#self.printer.lines] = ''
      self.printer:concat_text_block(result_representation, true)
    end
  end
