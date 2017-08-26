# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  checkboxes = $("input:checkbox")
  $(".all-checked").on "click", ->
      checkboxes.prop "checked", true
  $(".all-unchecked").on "click", ->
      checkboxes.prop "checked", false

  $(".cancel-discount").on "ajax:success", ->
    $(@).closest("tr").fadeOut(150)
