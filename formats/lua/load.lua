local parse = request('!.mechs.generic_loader')
local syntax = request('load.syntax')
local postprocess = request('load.postprocess.formatter')

return
  function(str)
    return parse(str, syntax, postprocess)
  end
