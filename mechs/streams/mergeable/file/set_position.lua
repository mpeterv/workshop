return
  function(self, new_position)
    new_position = math.max(new_position, 1)
    new_position = math.min(new_position, self.f:seek('end') + 1)
    self.f:seek('set', new_position - 1)
  end
