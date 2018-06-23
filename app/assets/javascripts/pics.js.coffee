# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#pics').imagesLoaded ->
    $('#pics').masonry
      itemSelector: '.box'
      columnWidth: 2
      isFitWidth: true 
      isAnimated: true 
      animationOptions: 
        duration: 200
        easing: 'swing'
        queue: false


