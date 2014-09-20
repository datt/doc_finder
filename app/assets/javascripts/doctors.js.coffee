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
      $("#years").text "2 years to 20 years"

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
          $("#amount").text "Rs. #{ui.values[0]} - Rs. #{ui.values[1]}"
          return

      $("#expirienceSlider").slider
        range: true
        min: 0
        max: 40
        values: [
          2
          20
        ]
        slide: (event, ui) ->
          $("#years").text "#{ui.values[0]} years to #{ui.values[1]} years"
          return

      $(".searchHeader").on "input", (e)->
        if $(".searchHeader").val().length >= 3
          #make ajax call
          console.log("change")


  Doctor.init()