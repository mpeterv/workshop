return
  function(self, prefix, postfix, node)
    prefix = prefix or ''
    postfix = postfix or ''
    local printer = self.printer

    printer:emit(prefix)
    printer:emit_nl()
    printer:inc_indent()

    self:process_node(node)

    printer:dec_indent()
    printer:emit_nl()
    printer:emit(postfix)
  end
