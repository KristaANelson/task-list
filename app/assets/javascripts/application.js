//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-sprockets
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require best_in_place
//= require jquery-ui
//= require best_in_place.jquery-ui
//= require_tree .

$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
});

$.datepicker.setDefaults({
    dateFormat: 'dd-mm-yy'
});
