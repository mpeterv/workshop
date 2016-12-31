--[[
  Process indent block. This may be represented with in styles:
  oneline and multiline.

  oneline samples:
    do <> end
    (<>)
  (Also note the presence of " " after prefix if it ends on character
  and possibly " " before postfix)

  multiline samples:
    do
      <>
    end
    (
      <>
    )

  There is also variative mode when we first try oneline and if we
  get too long representation then switch to multiline.

  --
  Emit some block with indent is indeed one of two frequent strucutres
  which formatter deals. Other is process list with separator.
]]
return
  function(self, prefix, postfix, node)
    -- Smart variative stuff will be here.
  end
