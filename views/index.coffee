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
          if num % 2 == 1 and letter in ['a','c','e','g']
            td class: "dark", ->
              if num == 7
                img src: 'images/chess_pieces/black_pawn.png', class: "chess_piece #{num+letter}"
              if num == 1
                if letter == 'a'
                  img src: 'images/chess_pieces/white_rook.png', class: "chess_piece #{num+letter}"
                if letter == 'g'
                  img src: 'images/chess_pieces/white_knight.png', class: "chess_piece #{num+letter}"
                if letter == 'c'
                  img src: 'images/chess_pieces/white_bishop.png', class: "chess_piece #{num+letter}"
                if letter == 'e'
                  img src: 'images/chess_pieces/white_queen.png', class: "chess_piece #{num+letter}"

          else if num % 2 == 0 and letter in ['b','d','f','h']
            td class: "dark", ->
              if num == 2
                img src: 'images/chess_pieces/white_pawn.png', class: "chess_piece #{num+letter}"
              if num == 8 
                if letter == 'h'
                  img src: 'images/chess_pieces/black_rook.png', class: "chess_piece #{num+letter}"
                if letter == 'b'
                  img src: 'images/chess_pieces/black_knight.png', class: "chess_piece #{num+letter}"
                if letter == 'f'
                  img src: 'images/chess_pieces/black_bishop.png', class: "chess_piece #{num+letter}"
                if letter == 'd'
                  img src: 'images/chess_pieces/black_king.png', class: "chess_piece #{num+letter}"

          else
            td class: "light", ->
              if num == 2
                img src: 'images/chess_pieces/white_pawn.png', class: "chess_piece #{num+letter}"
              if num == 7
                img src: 'images/chess_pieces/black_pawn.png', class: "chess_piece #{num+letter}"
              if num == 1 
                if letter == 'h'
                  img src: 'images/chess_pieces/white_rook.png', class: "chess_piece #{num+letter}"
                if letter == 'b'
                  img src: 'images/chess_pieces/white_knight.png', class: "chess_piece #{num+letter}"
                if letter == 'f'
                  img src: 'images/chess_pieces/white_bishop.png', class: "chess_piece #{num+letter}"
                if letter == 'd'
                  img src: 'images/chess_pieces/white_king.png', class: "chess_piece #{num+letter}"
              if num == 8
                if letter == 'a'
                  img src: 'images/chess_pieces/black_rook.png', class: "chess_piece #{num+letter}"
                if letter == 'g'
                  img src: 'images/chess_pieces/black_knight.png', class: "chess_piece #{num+letter}"
                if letter == 'c'
                  img src: 'images/chess_pieces/black_bishop.png', class: "chess_piece #{num+letter}"
                if letter == 'e'
                  img src: 'images/chess_pieces/black_queen.png', class: "chess_piece #{num+letter}"
coffeescript ->
  jQuery(document).ready ->
    now.ready ->
      $("#messages").show()
      now.distributeMessage('has connected')

    setPosition = (className, top, left) ->
      $("#messages").show()
      now.distributeMessage('has moved')
      now.updateElement(className, top, left)

    if $.cookie('klop_name')
      now.name = $.cookie('klop_name')
    else
      now.name = prompt("What's your name?", "")
      $.cookie('klop_name', now.name)
    className = ""
    $( ".chess_piece" ).draggable(
      opacity: 0.55
      refreshPositions: true
      start: (event, ui) ->
        className = ui.helper.context.className.toString()
      stop: (event, ui) ->
        piecePath= ui.helper.context.src.match(/chess_pieces*.*/)
        pieceName = piecePath.toString().replace("chess_pieces/", "")
        setPosition(className, ui.position.top, ui.position.left)
        now.distributeMessage('has moved a piece')
      )

    $("#text_input").keyup (event) ->
      if event.keyCode == 13
        now.distributeMessage($("#text_input").val())
        $("#text_input").val("")

    $("#send_button").click( () ->
      now.distributeMessage($("#text_input").val())
      $("#text_input").val("")
    )
    now.receiveMessage = (name, message) ->
      $("#messages").append("<p>" + name + ": " + message + "</p>")
    now.receiveElement= (className, top, left) ->
      $(".#{className.replace(" ",  ".").replace(" ui-draggable", "")}").css({"position":"relative","left":"#{left}px","top":"#{top}px"})


