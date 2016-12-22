local get_text_except_last_line = request('^.^.^.string.get_text_except_last_line')
local get_last_line = request('^.^.^.string.get_last_line')
-- local quote = request('^.^.^.compile.lua.quote_string')

return
  function(self, node)
    -- assert_table(node)
    if is_table(node) and node.type then
      local node_type = node.type or '?nil'
      local handlers = self.handlers[node_type]
      if is_function(handlers) then
        local handler = handlers
        handler(self, node)
      elseif is_table(handlers) then
        local init_state = self.printer:get_state()
        local init_text = self.printer:get_text()
        local init_text_base = get_text_except_last_line(init_text) or ''
        local init_last_line = get_last_line(init_text) or ''
        local good_state
        local good_text
        for i = 1, #handlers do
          self.printer:set_state(init_state)
          self.printer.text:init()
          self.printer.text:add(init_last_line)
          local handler = handlers[i].handler
          local is_multiline_handler = handlers[i].is_multilined

          local should_run_handler =
            not good_state or
            (
              good_state and
              (
                self.printer.is_multiline_allowed or
                (
                  not self.printer.is_multiline_allowed and
                  not is_multiline_handler
                )
              )
            )
          if should_run_handler then
            self.printer.is_multiline_allowed = is_multiline_handler
            handler(self, node)
            self.printer.is_multiline_allowed = is_multiline_handler
            local is_ok = self:representation_is_allowed()
            if is_ok or not good_state then
              good_state = self.printer:get_state()
              good_text = self.printer:get_text()
            end
            if not is_ok then
              break
            end
          end
        end
        self.printer.text:init()
        self.printer.text:add(init_text_base)
        self.printer:set_state(good_state)
        self.printer.text:add(good_text)
      else
        self.printer:emit('<' .. node_type .. '>')
      end
    end
  end
