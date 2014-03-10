

$(function() {


  $('.image_link').magnificPopup({
    type:'image'
  });


    var price = $('.price').text();

    $('#qty').change(function() {
    var quantity = $(this).find(":selected").val();
    console.log(quantity);
    $('.price').text(quantity * price);

  });




});
