local split_last_line = request('^.^.^.string.split_last_line')
-- local quote = request('^.^.^.compile.lua.quote_string')

return
  function(self, representers, ...)
    local init_state = self.printer:get_state()
    local init_text = self.printer:get_text()
    local init_text_base, init_last_line = split_last_line(init_text)
    local good_state
    local good_text
    for i = 1, #representers do
      self.printer:set_state(init_state)
      self.printer.text:init()
      self.printer.text:add(init_last_line)

      local handler = representers[i]
      if
        not handler.is_multiline or
        (handler.is_multiline and self.printer.variate_state.is_multiline_allowed)
      then
        self.printer.variate_state.is_multiline_allowed = handler.is_multiline
        handler.handle(self, ...)
        self.printer.variate_state.is_multiline_allowed = init_state.variate_state.is_multiline_allowed

        if
          not self.printer.variate_state.is_failed_to_represent and
          (
            not good_state or
            self:representation_is_allowed()
          )
        then
          good_state = self.printer:get_state()
          good_text = self.printer:get_text()
        end
      end
    end

    self.printer.text:init()
    self.printer.text:add(init_text_base)
    if not good_state then
      self.printer:set_state(init_state)
      self.printer.text:add(init_last_line)
      self.printer.variate_state.is_failed_to_represent = true
    else
      self.printer:set_state(good_state)
      self.printer.text:add(good_text)
      self.printer.variate_state.is_failed_to_represent = false
    end
  end
