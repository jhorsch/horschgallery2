
$(function(){

  // show billing info fields if not checked
  $('#billing_same').click(function() {
    if( $(this).is(':checked'))
    {
        $(".billing_toggle").hide();
    }
    else
    {
        $(".billing_toggle").show();
        $('#order_first_name_bill').val('')
        $('#order_last_name_bill').val('')
        $('#order_address1_bill').val('')
        $('#order_address2_bill').val('')
        $('#order_city_bill').val('')
        $('#order_state_bill').val('AL')
        $('#order_zipcode_bill').val('')
    }
  });

  // Automatically fill in billing if checked
  $('#payment-form').submit(function() {
    if( $('#billing_same').is(':checked') )
    {
      $('#order_first_name_bill').val($('#order_first_name_ship').val())
      $('#order_last_name_bill').val($('#order_last_name_ship').val())
      $('#order_address1_bill').val($('#order_address1_ship').val())
      $('#order_address2_bill').val($('#order_address2_ship').val())
      $('#order_city_bill').val($('#order_city_ship').val())
      $('#order_state_bill').val($('#order_state_ship').val())
      $('#order_zipcode_bill').val($('#order_zipcode_ship').val())
    }
  })

});

