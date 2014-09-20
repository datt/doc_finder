root = exports ? this

root.sendAjaxRequest = (settings) ->
  overlayContainer = undefined
  defaults =
    dataType: "script"
    requestType: "get"
    data: {}
    url: "/"
    async: true
    blockUI: false
    successCB: ->
    errorCB: ->

  settings = $.extend({}, defaults, settings)
  overlayClass = if settings["taking"] then ".takingOverlay.pagingContent" else ".contentOverlay"
  $.ajax
    async: settings["async"]
    type: settings["requestType"]
    url: settings["url"]
    dataType: settings["dataType"]
    data: settings["data"]
    beforeSend: (request) ->
      if settings["blockUI"]
        if settings["blockElement"]== undefined
          overlayContainer = $("body")
        else
          overlayContainer = settings["blockElement"]
        $(overlayContainer).css("position","relative")
        if $("#{overlayClass}").length != 0
          $("#{overlayClass}").remove()
        $(overlayContainer).prepend("<div class='#{overlayClass.split(".").join(" ")}'></div>")
      $("#{overlayClass}").show()
    complete: (request, json) ->
      $("#{overlayClass}").hide() if settings["blockUI"]
    success: settings.successCB
    error: settings.errorCB