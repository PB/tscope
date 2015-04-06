# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ->
  domain = '4code.pl'
  all = 'biuro' + '@' + domain
  $('#mc').html('<a target="_blank" href="mailto:' + all + '">' + all + '</a>')