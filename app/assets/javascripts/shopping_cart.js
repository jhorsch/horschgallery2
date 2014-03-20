 $(function(){

  // $('.stickem-container').stickem();

  var sticky_container = $('.payment_wrapper');

  var header_height = $('header').height() ;

  var top_break_point = $('.stickem-container').offset().top - header_height + 50;

  var bottom_break_point = $('.stickem-container').offset().top + $('.stickem-container').height();

  var aside_starting_top = sticky_container.offset().top + 50;
  var aside_height = sticky_container.height();


  $(window).resize(function(){
      sticky_container.removeClass('fix_aside_wrapper');
  });

  $(window).scroll(function() {


    var scrolling_top  =  $(window).scrollTop();
    var window_height = $(window).height();


    var scrolling_bottom = scrolling_top + aside_height - aside_starting_top;

    var aside_top_fixed_pos = header_height + 10;
    var aside_left_fixed_pos = sticky_container.offset().left - 30;


    if ((scrolling_top > top_break_point) && (scrolling_bottom <  bottom_break_point))
    {
        sticky_container.addClass('fix_aside_wrapper');
        $('.fix_aside_wrapper').css('left',aside_left_fixed_pos);
        $('.fix_aside_wrapper').css('top',aside_top_fixed_pos);
        $('.fix_aside_wrapper').css('margin-top','0');
    }
    else{
       sticky_container.removeClass('fix_aside_wrapper');
       $('.payment_wrapper').css('margin-top','50');
    }

  });


});
