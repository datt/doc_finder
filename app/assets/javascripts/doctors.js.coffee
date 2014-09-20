# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready ->
  Doctor =
    settings:
      timeSlider: $("#chargesSlider")

    init :->
      s = @settings
      @bindUIActions()
      $("#amount").text "Rs. 75 - Rs. 300"

    bindUIActions: ->
      $("#chargesSlider").slider
        range: true
        min: 10
        max: 1000
        values: [
          75
          300
        ]
        slide: (event, ui) ->
          $("#amount").text "Rs. " + ui.values[0] + " - Rs. " + ui.values[1]
          return

  Doctor.init()