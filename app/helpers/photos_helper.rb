module PhotosHelper

  def options_from_collection_for_select_with_price(
    collection, value_key, title_key, selected_val=nil, price_key="price")
    collection.map do |e|
    val = e.send(value_key.to_sym)
    title = e.send(title_key.to_sym)
    price = e.send(price_key.to_sym)
    selected_attr = (val == selected_val) ? " selected=\"selected\" " : " "
    "<option value=\"#{val}\" #{selected_attr} data-price=\"#{price}\">#{title}</option>"
    end.join("\n").html_safe
  end





end
