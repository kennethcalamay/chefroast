cartExists = ->
  list = $('div.contents .span3 ul')
  list.length > 0

makeRoomForCart = ->
  pc = $('div.products-container')
  pc.removeClass('span12')
  pc.addClass('span9')

createCart = ->
  contents = $('div.contents')
  contents.append('<div class="span3"><h4>Your Cart</h4><ul class="unstyled"></ul></div>')

appendItem = ->
  cart = $('div.contents .span3 ul')
  console.log cart
  cart.append('<li>New</li>')
  
$ ->
  $('a.add-to-cart').click ->
    if cartExists()
      appendItem()
    else
      makeRoomForCart()
      createCart()
      appendItem()
