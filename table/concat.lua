local chunk_name = 'concat'

local array_concat =
  function(...)
    local result = {}
    for i = 1, select('#', ...) do
      local term = select(i, ...)
      assert_table(term)
      for j = 1, #term do
        result[#result + 1] = term[j]
      end
    end
    return result
  end

tribute(chunk_name, array_concat)
