local parser = request('!.mechs.parser')
local handy = parser.handy

--[[
  Data sample:

  \Documents and Settings\All Users\Documents\My Pictures
  \Documents and Settings\All Users\Documents\My Pictures\Sample Pictures
  \Documents and Settings\All Users\Documents\My Videos
]]

return
  handy.list(
    {
      name = 'record',
      handy.rep(
        [[\]],
        {
          name = 'field',
          handy.match_regexp('[^%\x5C\n]*')
        }
      )
    },
    '\n'
  )
