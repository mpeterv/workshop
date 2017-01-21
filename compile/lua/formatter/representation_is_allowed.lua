local max_right_margin = 70

return
  function(self, representation)
    local text_width = representation:get_text_width()

    local result
    result = (text_width <= max_right_margin)

    return result
  end
