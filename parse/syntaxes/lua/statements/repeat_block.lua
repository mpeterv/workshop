local parser = request('^.^.^.parser')
local handy = parser.handy

local word = request('^.words.word')
local opt_spc = request('^.words.opt_spc')
local statements = request('statements')

local repeat_block =
  handy.interleave(
    {
      name = 'repeat_block',
      word('repeat'),
      statements,
      word('until'),
      '>expression',
    },
    opt_spc
  )

return repeat_block
