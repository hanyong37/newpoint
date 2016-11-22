class Admin::OrdersController < Admin::ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    if params[:filter].present? && Order.respond_to?(params[:filter])
      @orders = Order.send(params[:filter]).page params[:page]
    else
      @orders = Order.all.page params[:page]
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @lineitem = Lineitem.new
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to admin_orders_path, notice: 'Order was successfully created.'}
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update

    params[:order][:status] = 'submitted' if params.include? 'change_to_submitted'
    params[:order][:status] = 'delivering' if params.include? 'change_to_delivering'
    params[:order][:status] = 'preparing' if params.include? 'change_to_preparing'
    params[:order][:status] = 'recieved' if params.include? 'change_to_recieved'
    params[:order][:status] = 'cancelled' if params.include? 'change_to_cancelled'

    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to "/admin/orders?filter=#{params[:return_filter]}", notice: "订单[#{@order.id}]保存成功！"}
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to admin_orders_url, notice: '订单已被删除！' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:member_id, :memo, :address, :status, :feedback, :stars)
  end
end
