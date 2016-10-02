local parse_record = request('parse_record')
local fix_bad_line = request('fix_bad_line')
local trim_linefeed = request('^.^.^.string.trim_linefeed')

return
  function(parent, s)
    assert_string(s)
    s = trim_linefeed(s)
    local record, last_pos, has_problems = parse_record(parent, s)
    if has_problems and parent.dirty_data_allowed then
      local fix_succeded, fixed_s = fix_bad_line(s)
      if fix_succeded then
        record, last_pos, has_problems = parse_record(fixed_s)
      end
    end
    local is_unclosed_quote = has_problems and (last_pos > #s)
    return record, has_problems, is_unclosed_quote
  end
