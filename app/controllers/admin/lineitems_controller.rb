class Admin::LineitemsController < Admin::ApplicationController
  before_action :set_lineitem, only: [:show, :edit, :update, :destroy]

  # GET /lineitems
  # GET /lineitems.json
  def index
    @lineitems = Lineitem.all
  end

  # GET /lineitems/1
  # GET /lineitems/1.json
  def show
  end

  # GET /lineitems/new
  def new
    @lineitem = Lineitem.new
  end

  # GET /lineitems/1/edit
  def edit
    @order = Order.find(@lineitem.order_id)
  end

  # POST /lineitems
  # POST /lineitems.json
  def create
    @lineitem = Lineitem.new(lineitem_params)
    @order = Order.find(@lineitem.order_id)
    if @lineitem.validate
      @lineitem.price = @lineitem.amount * @lineitem.product.price
      @lineitem.description = '产品明细描述'
    end

    respond_to do |format|
      if @lineitem.save
        format.html { redirect_to edit_admin_order_path(@order), notice: 'Lineitem was successfully created.' }
        format.json { render :show, status: :created, location: @lineitem }
      else
        format.html { render :new }
        format.json { render json: @lineitem.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /lineitems/1
  # PATCH/PUT /lineitems/1.json
  def update
    @order = @lineitem.order
    respond_to do |format|
      if @lineitem.update(lineitem_params)
        format.html { redirect_to edit_order_path(@order), notice: 'Lineitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @lineitem }
      else
        format.html { render :edit }
        format.json { render json: @lineitem.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /lineitems/1
  # DELETE /lineitems/1.json
  def destroy
    @order = @lineitem.order
    @lineitem.destroy
    respond_to do |format|
      format.html { redirect_to edit_admin_order_path(@order) , notice: 'Lineitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lineitem
      @lineitem = Lineitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lineitem_params
      params.require(:lineitem).permit(:product_id, :amount, :order_id, :price, :description)
    end
end
