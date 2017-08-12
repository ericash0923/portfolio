ready = ->
  Typed.new '.element',
    strings: [
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
      'Mauris vestibulum finibus nisi, eu mollis metus. Donec iaculis ipsum vel erat vestibulum suscipit.'
    ]
    typeSpeed: 0
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready