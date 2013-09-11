$ ->
  fadeText = (selector) ->
    $("#{selector}").fadeIn(500).delay(2500).fadeOut 500, ->
      $(this).appendTo $(this).parent()
      fadeText(selector)

  fadeText('#blinky .pbr:hidden:first')
