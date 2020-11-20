// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$( document ).ready(function() {


    function addToList(listID, obj) {
      $( listID ).append('<tr><td>' + obj['name'] + '</td></tr>');
    }

    $('#results').hide();
    $('#invalid-address').hide();

    $('#get-score').click(function() {
      $('#invalid-address').hide();
      $.post( "/walkability_score", { address: $('#address').val() } )
      .done(function(data) {
        $('span#score').text(data['score']);
        $('span#food').text(data['food'].length);
        $('span#shops').text(data['shops'].length);
        $('span#transit').text(data['transit'].length);
        $( "#shops-list" ).empty()
        $.each( data['shops'], function( index, obj ){ addToList( "#shops-list", obj)});
        $( "#foods-list" ).empty()
        $.each( data['food'], function( index, obj ){ addToList( "#foods-list", obj)});
        $( "#transit-list" ).empty()
        $.each( data['transit'], function( index, obj ){addToList(  "#transit-list", obj)});

        $( "#results" ).show();
      })
      .fail(function() {
        $('#address').val('');
        $('#results').hide();
        $('#invalid-address').show();
      })
    });
});
