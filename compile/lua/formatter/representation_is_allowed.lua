local get_metrics = request('printer.get_text_metrics')
local quote = request('^.^.^.compile.lua.quote_string')
local table_to_str = request('^.^.^.save_to.lua.serialize_table.lua_table')

local max_right_margin = 70
-- local max_text_width = 70

return
  function(self)
    local text = self.printer:get_text()
    local metrics = get_metrics(text)
    -- local result = (metrics.text_width <= max_text_width)

    local is_multiline_allowed = self.printer.is_multiline_allowed
    local result =
      (metrics.right_margin <= max_right_margin) and
      (
        (metrics.num_lines == 1) or
        (
          (metrics.num_lines > 1) and
          is_multiline_allowed
        )
      )
      -- print('metrics.num_lines', metrics.num_lines, self.printer.is_multiline_allowed)

    --[=[
    print(
      ([[
%s
%s
%s
==]]):
      format(
        result,
        quote(self.printer:get_text()),
        table_to_str(metrics)
      )
    )
    --]=]
    return result
  end
