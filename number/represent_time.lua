local representer = request('represent')

representer =
  new(
    representer,
    {
      type = 'general_time',
      digits_display = 3,
    }
  )
representer:init()

return
  function(n)
    return representer:represent(n)
  end
