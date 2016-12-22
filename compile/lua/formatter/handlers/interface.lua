return
  {
    expression =
      {
        {
          is_multilined = true,
          handler = request('multiline.expression'),
        },
        {
          handler = request('oneline.expression'),
        },
      },

    function_call = request('oneline.expressions.function_call'),
    name = request('oneline.expressions.name'),
    var_link = request('oneline.expressions.var_link'),
    vararg = request('oneline.expressions.vararg'),

    boolean = request('oneline.expressions.data_types.boolean'),
    ['nil'] = request('oneline.expressions.data_types.nil'),
    number = request('oneline.expressions.data_types.number'),
    string = request('oneline.expressions.data_types.string'),
    table =
      {
        {
          is_multilined = true,
          handler = request('multiline.expressions.data_types.table'),
        },
        {
          handler = request('oneline.expressions.data_types.table'),
        },
      },
    type_function = request('multiline.expressions.data_types.type_function'),

    statements = request('multiline.statements'),

    assignment = request('oneline.statements.assignment'),
    break_statement = request('oneline.statements.break_statement'),
    goto_statement = request('oneline.statements.goto_statement'),
    label_statement = request('oneline.statements.label_statement'),
    local_assignment = request('oneline.statements.local_assignment'),
    return_statement =
      {
        {
          is_multilined = true,
          handler = request('multiline.statements.return_statement'),
        },
        {
          handler = request('oneline.statements.return_statement'),
        },
      },

    do_block =
      {
        {
          is_multilined = true,
          handler = request('multiline.statements.blocks.do_block'),
        },
      },
    generic_for_block =
      {
        {
          is_multilined = true,
          handler = request('multiline.statements.blocks.generic_for_block'),
        },
      },
    if_block =
      {
        {
          is_multilined = true,
          handler = request('multiline.statements.blocks.if_block'),
        },
      },
    local_named_function =
      {
        {
          is_multilined = true,
          handler = request('multiline.statements.blocks.local_named_function'),
        },
      },
    named_function =
      {
        {
          is_multilined = true,
          handler = request('multiline.statements.blocks.named_function'),
        },
      },
    numeric_for_block =
      {
        {
          is_multilined = true,
          handler = request('multiline.statements.blocks.numeric_for_block'),
        },
      },
    repeat_block =
      {
        {
          is_multilined = true,
          handler = request('multiline.statements.blocks.repeat_block'),
        },
      },
    while_block =
      {
        {
          is_multilined = true,
          handler = request('multiline.statements.blocks.while_block'),
        },
      },

    bracket_expr = request('oneline.wrappers.bracket_expr'),
    colon_name = request('oneline.wrappers.colon_name'),
    dot_name = request('oneline.wrappers.dot_name'),
    dot_list = request('oneline.wrappers.dot_list'),
    expr_list = request('oneline.wrappers.expr_list'),
    func_args = request('oneline.wrappers.func_args'),
    function_params = request('oneline.wrappers.function_params'),
    name_list = request('oneline.wrappers.name_list'),
    name_parts = request('oneline.wrappers.name_parts'),
    par_expr = request('oneline.wrappers.par_expr'),
    ref_list = request('oneline.wrappers.ref_list'),
  }
