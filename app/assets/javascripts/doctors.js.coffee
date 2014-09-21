# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready ->
  s = undefined
  Doctor =
    settings:
      timeSlider: $("#chargesSlider")
      expCurrentStart: 2
      expCurrentEnd: 20
      feeCurrentStart: 75
      feeCurrentEnd: 300
      doctorsElements: $(".doctorsList li")
      prevKeywordLength: 0

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
          s.feeCurrentStart
          s.feeCurrentEnd
        ]
        slide: (event, ui) ->
          $("#amount").text "Rs. #{ui.values[0]} - Rs. #{ui.values[1]}"
          return
        stop: ( event, ui ) ->
          s.feeCurrentStart = ui.values[0]
          s.feeCurrentEnd = ui.values[1]
          Doctor.filterDoctorsList()

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
        stop: ( event, ui ) ->
          Doctor.filterDoctorsList()
          s.expCurrentStart = ui.values[0]
          s.expCurrentEnd = ui.values[1]

      $(".searchHeader").on "input", (e)->
        Doctor.filterDoctorsList()
        Doctor.nameOrSymptomSearch($(".searchHeader").val())
        prevKeywordLength = $(".searchHeader").val().length

    filterDoctorsList: ->
      console.log "filter"
      $(".noDoc").hide()
      doctorsToShow = $.grep(s.doctorsElements, (element, index) ->
        $(element).data("fees") >= s.feeCurrentStart and $(element).data("fees") <= s.feeCurrentEnd and $(element).data("years") >= s.expCurrentStart and $(element).data("years") <= s.expCurrentEnd
      )

      Doctor.showHideDocElements(doctorsToShow)

    nameOrSymptomSearch: (keyword)->
      keyword = $.trim(keyword.toLowerCase())
      if $(".doctorsList li:visible").length == 0
        Doctor.filterDoctorsList()
      else
        doctorsToShow = $(".doctorsList li:visible")
        if $(doctorsToShow).length>0
          doctorsToShow = $.grep(doctorsToShow, (element, index) ->
            ($(element).data("symptoms")!= undefined && $(element).data("symptoms").toLowerCase().indexOf(keyword)!=-1) || ($(element).data("name")!= undefined && $(element).data("name").toLowerCase().indexOf(keyword)!=-1)
          )
          Doctor.showHideDocElements(doctorsToShow)

    showHideDocElements: (doctorsToShow)->
      $(s.doctorsElements).hide()
      $(doctorsToShow).show()

      if $(".doctorsList li:visible").length == 0
        $(".noDoc").show()


  Doctor.init()