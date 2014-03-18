 $(function(){

  var nav_fluid = $('.checkout_aside_wrapper');
  var top_break_point = 144;
  var bottom_break_point = $('.why_buy_wrapper').offset().top + $('.why_buy_wrapper').height();
  console.log('bottom_break',bottom_break_point);
  var aside_starting_top = nav_fluid.offset().top;
  var aside_height = nav_fluid.height();


  $(window).resize(function(){
      nav_fluid.removeClass('fix_aside_wrapper');
  });

  $(window).scroll(function() {



    var scrolling_top  =  $(window).scrollTop();
    var window_height = $(window).height();
    console.log(window_height);
    var scrolling_bottom = scrolling_top + window_height - aside_starting_top;

    var aside_top_fixed_pos = $('header').height() + 10;
    var aside_left_fixed_pos = nav_fluid.offset().left - 30;

    if ((scrolling_top > top_break_point) && (scrolling_bottom < bottom_break_point))
    {
        nav_fluid.addClass('fix_aside_wrapper');
        $('.fix_aside_wrapper').css('left',aside_left_fixed_pos);
        $('.fix_aside_wrapper').css('top',aside_top_fixed_pos);
    }
    else{
       nav_fluid.removeClass('fix_aside_wrapper');
    }

  });

});
