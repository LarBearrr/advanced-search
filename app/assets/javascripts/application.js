// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery.autosize
//= require_tree .

$(document).ready(function(){
    // grow text area based on content
    $('textarea').autosize();

    // remove empty line breaks from textrea
    $('textarea').blur(function(){
        var value = $(this).val();
        value=value.replace(/^\s*[\r\n]/gm,'');
        $(this).val(value);
        $('textarea').trigger('autosize.resize');
    });

    // show indicator as it's querying
    $('#j-brandfolder-advanced-search').submit(function(e) {
        $("#submit_search").attr('disabled', true);
        $("#submit_search").find('span').hide();
        $("#submit_search").find('.la-ball-fall').show();
    });
});