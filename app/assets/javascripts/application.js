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
//= require jquery
//= require jquery_ujs
// = require turbolinks
// = require bootstrap
// = require_tree .


$(document).on ('turbolinks:load',function () {
    $(document).on('click', '.js-toggle-menu', function() {
      $('.js-vertical-menu').toggleClass('active');
      $('.js-content-wrap').toggleClass('vert-opened');
      $('.part').toggleClass('part2');
    });
    $( "#sidebar li a" ).hover(

      function() {

        $('#sidebar li a').each(function () {
          $(this).mouseover(function() {
            $(this).addClass('jshover');
          });
          $(this).mouseout(function() {
            $(this).removeClass('jshover');
          });
        });
      });




    $(function () {
      var location = window.location.href;
      var cur_url = '/' + location.split('/').pop();

      $('#sidebar li a').each(function () {
          var link = $(this).attr('href');


          if (cur_url == link)
          {
              $(this).addClass('active_link');
          }
        });
      });
    // $(document).on('click', 'nav.vertical-menu.js-vertical-menu ul li a', function() {
    //   $(this).addClass( "active_link" );
    //   // alert (this);
    //   // $(this.parent())addClass( "active_link" );
    // });

});
