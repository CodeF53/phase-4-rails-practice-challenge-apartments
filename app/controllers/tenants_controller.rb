class TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :update, :destroy]

  # GET /tenants
  def index
    render json: Tenant.all
  end

  # GET /tenants/1
  def show
    render json: @tenant
  end

  # POST /tenants
  def create
    @tenant = Tenant.create!(tenant_params)
    render json: @tenant, status: :created, location: @tenant
  end

  # PATCH/PUT /tenants/1
  def update
    @tenant.update!(tenant_params)
    render json: @tenant
  end

  # DELETE /tenants/1
  def destroy
    @tenant.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tenant
    @tenant = Tenant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tenant_params
    params.require(:tenant).permit(:name, :age)
  end
end
