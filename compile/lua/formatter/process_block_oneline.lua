return
  function(self, prefix, postfix, node)
    prefix = prefix or ''
    postfix = postfix or ''
    local printer = self.printer

    local prefix_need_space = not prefix:match('[%p]$')
    printer:emit(prefix)
    if prefix_need_space then
      printer:emit(' ')
    end
    printer:inc_indent()

    self:process_node(node)

    local postfix_need_space = not postfix:match('^[%p]')
    printer:dec_indent()
    if postfix_need_space then
      printer:emit(' ')
    end
    printer:emit(postfix)
  end
