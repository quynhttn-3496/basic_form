class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    return render :new if @order.invalid?
  end

  def create
    @order = Order.new(order_params)
    return render :new if params[:button] == 'back'

    if @order.save
      session[:order] = @order.id
      return redirect_to complete_orders_url
    end
    
    render :confirm
  end

  def complete
    @order = Order.find(session[:order]) if session[:order]
    session[:order] = nil
    return redirect_to new_order_url unless @order
  end

  private

  def order_params
    params.require(:order).permit(:name,
                                  :email,
                                  :phone,
                                  :delivery_address,)
  end
end