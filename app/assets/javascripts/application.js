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
//= require jquery-ui
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require tinymce-jquery


$(document).ready(function() {
	$(".list-chapter").click(function(e){
		if ($(this).find("td:lt(4) > span").hasClass('glyphicon-triangle-right')) {
			$('.open').next('.content').toggle('fast');
			$('.open').find("td:lt(4) > span").removeClass('glyphicon-triangle-bottom').addClass('glyphicon-triangle-right');
			$('.open').removeClass('open');

			$(this).next('.content').toggle('fast');
			$(this).find("td:lt(4) > span").removeClass('glyphicon-triangle-right').addClass('glyphicon-triangle-bottom');
			$(this).addClass('open');
		} else {
			$(this).next('.content').toggle('fast');
			$(this).find("td:lt(4) > span").removeClass('glyphicon-triangle-bottom').addClass('glyphicon-triangle-right');
			$(this).removeClass('open');
		}
	});
});
