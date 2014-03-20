//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/



$(function(){


    // var pathname =  window.location.protocol + '//' + window.location.host  + window.location.pathname;
    var pathname = $('.category_page_category_name').attr('href');

    $('.sub_menu_container').find('a').each(function() {

    if ($(this).attr('href') == pathname)
    {
        $(this).css('color','#DA7C05');
        $(this).css('font-weight','bold');

        // $(this).closest('.main_cat_grouping').find('h3').css('color','#DA7C05');


        $(this).closest('.main_menu').children('a').css('color','#DA7C05');

    }

    });
});

