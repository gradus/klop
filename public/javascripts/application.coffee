jQuery(document).ready ->
  now.name = prompt("What's your name?", "")
  $("#send_button").click( () ->
    now.distributeMessage($("#text_input").val())
    $("#text_input").val("")
  )
  now.receiveMessage = (name, message) ->
    $("#messages").append("<br>" + name + ": " + message)
