class AdminAdminActivationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @admin_no_active = Admin.where(activated: false)
    @admin_active = Admin.where(activated: true)
  end

  def activate
    @admin = Admin.find(params[:id])
    respond_to do |format|
      if @admin.activate
        format.html do
          flash[:notice] = I18n.t("activations_controller.notices.activate.success")
          render "index"
        end
      else
        format.html do
          flash[:notice] =I18n.t("activations_controller.notices.activate.error")
          render "index"
        end
      end
    end
  end

  def deactivate
    @admin = Admin.find(params[:id])
    respond_to do |format|
      if @admin.deactivate
        format.html do
          flash[:notice] =I18n.t("activations_controller.notices.deactivate.success")
          render "index"
        end
      else
        format.html do
          flash[:notice] =I18n.t("activations_controller.notices.deactivate.error")
          render "index"
        end
      end
    end
  end
end
