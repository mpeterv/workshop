return
  {
    handlers = request('handlers.interface'),
    printer = request('printer.interface'),

    init = request('init'),
    process_list = request('process_list'),
    process_node = request('process_node'),
    representation_is_allowed = request('representation_is_allowed'),
  }
