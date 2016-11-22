module ProductHelper
  def add_button
    form_tag '/weixin/cart/add_items', method: :post, style: "display: inline-block;" do
      hidden_field_tag 'product_id', value: product.id
      button_tag name: "add_to_cart" ,class: '' do
        '+'
      end
    end
  end

  def remove_button
    button_tag name: "remove_from_cart" ,class: '' do
      '-'
    end
  end
end
