module OrdersHelper

  def left_button(status)
    left = find_left_and_right_status(status)[0]
    if left
      button_tag name: "change_to_#{left}" ,class: 'btn btn-warning btn-xs' do
        '<'
      end
    else
      button_tag name: "",  disabled: true ,class: 'btn btn-default btn-xs' do
        '_'
      end
    end
  end

  def right_button(status)
    right = find_left_and_right_status(status)[1]
    if right
      button_tag name: "change_to_#{right}", class: 'btn btn-success btn-xs' do
        '>'
      end
    else
      button_tag name: "",  disabled: true ,class: 'btn btn-default btn-xs' do
        '_'
      end
    end
  end


  def find_left_and_right_status(status)
    list = ['cancelled','submitted','preparing', 'delivering', 'recieved']
    n = list.find_index(status)
    left = (n && n>0 ? list[n-1] :nil)
    right = (n && n<list.size ? list[n+1] :nil)
    return [left, right]
  end

end

