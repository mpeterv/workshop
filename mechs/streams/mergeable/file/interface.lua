local merge = request('!.table.merge')
local result = new(request('^.interface'))
local original_init = result.init
return
  merge(
    result,
    {
      init = request('init'),
      get_position = request('get_position'),
      set_position = request('set_position'),
      read = request('read'),
      -- extensions:
      match_string = request('match_string'),
      -- internal:
      f = nil,
      original_init = original_init,
    }
  )