local printer_class = request('^.^.^.string.text_block.interface')

return
  function(self, representer, is_multiline, node)
    local original_presentation = self.printer
    local original_multiline_allowed = self.is_multiline_allowed

    local trial_presentation = new(printer_class)
    trial_presentation.indent_chunk = self.indent_chunk
    trial_presentation:init()
    local num_lines = #original_presentation.lines
    trial_presentation.lines[1] = original_presentation.lines[num_lines]
    trial_presentation.line_indents[1] = original_presentation.line_indents[num_lines]
    trial_presentation.next_line_indent = original_presentation.next_line_indent

    self.printer = trial_presentation
    self.is_multiline_allowed = is_multiline

    representer(self, node)

    self.is_multiline_allowed = original_multiline_allowed
    self.printer = original_presentation

    local has_failed
    if is_nil(trial_presentation.has_failed_to_represent) then
      has_failed = false
    else
      has_failed = trial_presentation.has_failed_to_represent
    end
    if not is_multiline and (#trial_presentation.lines > 1) then
      has_failed = true
    end

    return trial_presentation, has_failed
  end

