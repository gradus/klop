h2 -> 
  "The following Muppets are involved"
ul ->
  for name, index in @people
    li -> 
      a href: "/people/#{index}", -> name
div id: 'messages'
div id: 'chat_input', ->
  input id: 'text_input', type: 'text'
  input id: 'send_button', type: 'submit', value: 'Chat'

div id: 'chessboard', ->
  table cellpadding: 0, cellspacing: 0, ->
    for num in [8..1]
      tr ->
        for letter in ['a','b','c','d','e','f','g','h']
          if num in [1,3,5,7] and letter in ['a','c','e','g']
            td class: 'dark', -> 
              "&nbsp;" + letter + num
          else if num in [2,4,6,8] and letter in ['b','d','f','h']
            td class: 'dark', -> 
              "&nbsp;" + letter + num
          else
            td class: 'light', -> 
              "&nbsp;" + letter + num
coffeescript ->
  jQuery(document).ready ->
    if $.cookie('klop_name')
      now.name = $.cookie('klop_name')
    else
      now.name = prompt("What's your name?", "")
      $.cookie('klop_name', now.name)

    $("#text_input").keyup (event) ->
      if event.keyCode == 13
        $("#messages").show()
        now.distributeMessage($("#text_input").val())
        $("#text_input").val("")

    $("#send_button").click( () ->
      $("#messages").show()
      now.distributeMessage($("#text_input").val())
      $("#text_input").val("")
    )
    now.receiveMessage = (name, message) ->
      $("#messages").append("<p>" + name + ": " + message + "</p>")

