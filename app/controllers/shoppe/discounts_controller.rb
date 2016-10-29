module Shoppe
  class DiscountsController < Shoppe::ApplicationController
    before_action { params[:id] && @discount = Shoppe::Discount.find(params[:id]) }

    def index
      @discounts = Shoppe::Discount.order('code asc')
    end

    def new
      @discount = Shoppe::Discount.new
    end

    def update
      if @discount.update(safe_params)
        redirect_to [:edit, @discount], :flash => {:notice => t('shoppe.discounts.update_notice') }
      else
        render :action => "edit"
      end
    end

    def create
      @discount = Shoppe::Discount.new(safe_params)
      if @discount.save
        redirect_to :discounts, :flash => {:notice =>  t('shoppe.discounts.create_notice') }
      else
        render :action => "new"
      end
    end

    def destroy
      @discount.destroy
      redirect_to :discounts, flash: { notice: t('shoppe.discounts.destroy_notice') }
    end

    private

    def safe_params
      params.require(:discount).permit(:code, :value, :unit, :description, :max_uses, :max_uses_per_user, :active, :expire_at)
    end

    def set_discount
      @discount = Shoppe::Discount.find(params[:id])
    end
  end
end
