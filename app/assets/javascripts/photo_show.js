

//change price when page loads
$(function(){

  //change price
  var option_size_price = Number($('#choose_size option:selected').val());
  var frame_price = Number($('#choose_frame option:selected').val());
  var plate_price = Number('0');
  var total_price =  option_size_price + frame_price + plate_price
  $('.price').text(total_price);


  // when you change the options size drop down ...
  $('#choose_size').change(function() {

    //change price
    var option_size_price = Number($('#choose_size option:selected').val());
    var frame_price = Number($('#choose_frame option:selected').val());
    var plate_price = Number('0');
    var total_price =  option_size_price + frame_price + plate_price
    $('.price').text(total_price);

     //remove mat row if photo only
      var option_size_name_only = $('#choose_size option:selected').text().slice(-4);
      var option_size_name_mat = $('#choose_size option:selected').text().slice(-3);
      var option_size_name_framed = $('#choose_size option:selected').text().slice(-6);

      if (option_size_name_only == "Only")
      {
          $('.row_mat').hide();
          $('.row_frame').hide();
      }
      else if (option_size_name_mat == "Mat")
      {
          $('.row_mat').show();
          $('.row_frame').hide();
      }
      else
      {
          $('.row_mat').show();
          $('.row_frame').show();
      }


  });


  // when you change the frame options drop down ...
  $('#choose_frame').change(function() {

    // change price if frame option changes
    var option_size_price = Number($('#choose_size option:selected').val());
    var frame_price = Number($('#choose_frame option:selected').val());
    var plate_price = Number('0');
    var total_price =  option_size_price + frame_price + plate_price
    $('.price').text(total_price);

  });


  //show enlarged image
  $('.image_link').magnificPopup({
    type:'image'
  });

  //highlight correct categories


  // breadcrumb_sub_cat


    var pathname = $('.detail_page_category_name').attr('href');
    // console.log(pathname);

    $('.sub_menu_container').find('a').each(function() {

    if ($(this).attr('href') == pathname)
    {
        $(this).css('color','#DA7C05');
        $(this).css('font-weight','bold');

        // $(this).closest('.main_cat_grouping').find('h3').css('color','#DA7C05');

        $(this).closest('.main_menu').children('h2').children('a').css('color','#DA7C05');

    }

    });


});


