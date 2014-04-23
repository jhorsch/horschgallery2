

//change price when page loads
$(function(){



//ENLARGE IMAGE LINK

$(".image_link").fancybox({

    type: 'image',
    padding: [10, 10, 10, 10],
    closeBtn: true,
    closeClick: true,
    openSpeed: 750,
    closeSpeed: 250,
    helpers: {
        overlay : {
            css : {
                'background' : 'rgba(25, 25, 25, 0.98)'
            }
        }
    }
});

$(".option_helpers")
    .fancybox({
        type: 'inline',
        padding: 30,
        closeClick: true,
        margin: 50,
        openSpeed: 500,
        autoSize: true,
        maxWidth: 1000,
        scrolling  : 'auto'
});


  //change price
  var option_size_price = Number($('#choose_size option:selected').attr('data-price'));
  var frame_price = Number($('#choose_frame option:selected').attr('data-price'));
  var plate_price = Number('0');
  var total_price =  option_size_price + frame_price + plate_price
  $('.price').text(total_price);


  // when you change the options size drop down ...
  $('#choose_size').change(function() {

    //change price
    var option_size_price = Number($('#choose_size option:selected').attr('data-price'));
    var frame_price = Number($('#choose_frame option:selected').attr('data-price'));
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
          $('#choose_mat').append("<option value='20' selected='selected'  data-price='0'>No Mat</option>");
          $('.row_frame').hide();
          $('#choose_frame').append("<option value='3' selected='selected'  data-price='0'>No Frame</option>");

      }
      else if (option_size_name_mat == "Mat")
      {
          $('.row_mat').show();
          $("#choose_mat option[value=20]").remove();
          $('.row_frame').hide();
          $('#choose_frame').append("<option value='3' selected='selected'  data-price='0'>No Frame</option>");


      }
      else
      {
          $('.row_mat').show();
          $('.row_frame').show();
          $("#choose_mat option[value=20]").remove();
          $("#choose_frame option[value=3]").remove();



      }


  });


  // when you change the frame options drop down ...
  $('#choose_frame').change(function() {

    // change price if frame option changes
    var option_size_price = Number($('#choose_size option:selected').attr('data-price'));
    var frame_price = Number($('#choose_frame option:selected').attr('data-price'));
    var plate_price = Number('0');
    var total_price =  option_size_price + frame_price + plate_price
    $('.price').text(total_price);

  });


  // MAT NAME CHANGES WITH BW CONVERSION

  //FILL INITIAL MAT ARRAY
  var initial_mat_array = [];
  $("#choose_mat option").each(function(){
      var mat_name = $(this).text();
      initial_mat_array.push(mat_name);
  });



  //RUN CONDITION FOR BW CHOICE
  $('#choose_bw').change(function() {

    var bw_value = $('#choose_bw option:selected').text();

    if  (bw_value == 'Yes'){
      $('#choose_mat').empty();
      $('#choose_mat').append("<option value='2'>Fog / Black</option>");
      $('#choose_mat').append("<option value='1'>Bright White - Single Mat</option>");
    }
    else{
      $('#choose_mat').empty();
      for ( var i = 0, l = initial_mat_array.length; i < l; i++ ) {
        $('#choose_mat').append('<option value='+(i+1)+'>'+initial_mat_array[i]+'</option>');
        console.log('<option value="'+(i+1)+'">'+initial_mat_array[i]+'</option>');
      }
    }

  });




});


