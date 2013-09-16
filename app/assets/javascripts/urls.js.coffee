$ ->
  fadeText = (selector) ->
    $("#{selector}").fadeIn(500).delay(2500).fadeOut 500, ->
      $(this).appendTo $(this).parent()
      fadeText(selector)

  $('.alert-box').delay(500).fadeIn('normal', ->
    $(this).delay(2500).fadeOut()
  )



  fadeText('#blinky .pbr:hidden:first')

