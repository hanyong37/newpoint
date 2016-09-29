##
`
rails g scaffold catagory name desc status
rails g scaffold product name desc:text price:decimal photo status:int catagory_id stock:integer

rails g scaffold customer name weixin_id mobile member_type balance:decimal photo status:integer
rails g scaffold address reciever_mobile  reciever_name addr_desc customer_id
`
