// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $(".question td:nth-child(1)").on('click', function(e) {
    e.preventDefault();
    var url = this.first().attr('href');
    $.ajax({
      url: url,
      type: 'GET'
    }).done(function(response) {
      console.log(response);
    }); //done done
  }); // click done
}); //ready done
