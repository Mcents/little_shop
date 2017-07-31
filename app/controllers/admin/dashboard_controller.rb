class Admin::DashboardController <Admin::BaseController
 
  def index
    if params.include?("status")
      @order = Order.where(status: params[:status])
      render :show
    else
      @orders = Order.all 
    end
  end

  def edit_status
    @order = Order.find(params[:order_id])
      if @order.status == 'ordered'
      @order.update_attribute :status, 1

      redirect_back(fallback_location: admin_dashboard_path)
    elsif @order.status == 'paid'
      @order.update_attribute :status, 2

      redirect_back(fallback_location: admin_dashboard_path)
    end
  end

end
