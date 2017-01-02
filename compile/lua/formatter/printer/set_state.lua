return
  function(self, state)
    self.indent = state.indent
    self.has_debt = state.has_debt
    self.is_multiline_allowed = state.is_multiline_allowed
    self.on_clean_line = state.on_clean_line
  end
