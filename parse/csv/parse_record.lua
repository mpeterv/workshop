-- Comma-separated lines parser

--[[
  Implemented as state machine with function records.
  For maximum performace of this structure I've tried
  to convert it to series of elseif's where state is
  string constant. Got small performance increase
  (about 7%) and horribly looking code. Reverted back.
]]

local quote_char = '"'
local field_sep_char = ','
local record_sep_char = '\n'
local eot = ''

local term
local result

local add_char =
  function(char)
    term = term .. char
  end

local add_term =
  function()
    result[#result + 1] = term
    term = ''
    -- print(('[%d] = %q'):format(#result, result[#result]))
  end

local states
states =
  {
    waiting_to_begin =
      function(cur_char)
        local next_state
        if (cur_char == record_sep_char) or (cur_char == eot) then
          add_term()
          next_state = states.finished
        elseif (cur_char == field_sep_char) then
          add_term() --term is empty string in this case
        elseif (cur_char == quote_char) then
          next_state = states.reading_in_quotes
        else
          add_char(cur_char)
          next_state = states.reading_unquoted
        end
        return next_state
      end,
    reading_unquoted =
      function(cur_char)
        local next_state
        if (cur_char == record_sep_char) or (cur_char == eot) then
          add_term()
          next_state = states.finished
        elseif (cur_char == field_sep_char) then
          add_term()
          next_state = states.waiting_to_begin
        else
          add_char(cur_char)
        end
        return next_state
      end,
    reading_in_quotes =
      function(cur_char)
        local next_state
        if (cur_char == quote_char) then
          next_state = states.checking_double_quotes
        elseif (cur_char == eot) then
          next_state = states.broken
        else
          add_char(cur_char)
        end
        return next_state
      end,
    checking_double_quotes =
      function(cur_char)
        local next_state
        if (cur_char == quote_char) then
          add_char(quote_char)
          next_state = states.reading_in_quotes
        elseif (cur_char == record_sep_char) or (cur_char == eot) then
          add_term()
          next_state = states.finished
        elseif (cur_char == field_sep_char) then
          add_term()
          next_state = states.waiting_to_begin
        else
          add_term()
          next_state = states.waiting_delimiter
        end
        return next_state
      end,
    waiting_delimiter =
      function(cur_char)
        local next_state
        if (cur_char == record_sep_char) or (cur_char == eot) then
          next_state = states.finished
        elseif (cur_char == field_sep_char) then
          next_state = states.waiting_to_begin
        else
          next_state = states.broken
        end
        return next_state
      end,
    finished =
      function(cur_char)
        error()
      end,
    broken = --unclosed quote
      function(cur_char)
        error()
      end,
  }

return
  function(s)
    result = {}
    term = ''
    local state = states.waiting_to_begin
    local cur_position = 1
    while true do
      local cur_char = s:sub(cur_position, cur_position)
      state = state(cur_char) or state
      if (state == states.finished) or (state == states.broken) then
        break
      end
      cur_position = cur_position + 1
    end
    local has_errors = (state == states.broken)
    return result, cur_position, has_errors
  end
