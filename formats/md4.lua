local calculator = request('md4.interface')
return
  function(data)
    calculator:init()
    return calculator:get_hash_str(data)
  end
