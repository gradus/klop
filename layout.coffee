html ->
  head ->
    title 'KLOP is coming'
  body ->
    div id: 'header', ->
      h1 ->
        "KLOP is Coming"
    div id: 'wrap',
      -> @render @content, @context
    div id: 'header', ->
      p 'Powered with Meryl, Node, Coffescript, and Coffeekup!'
