class LeasesController < ApplicationController
  before_action :set_lease, only: [:destroy]

  # POST /leases
  def create
    @lease = Lease.create!(lease_params)
    render json: @lease, status: :created, location: @lease
  end

  # DELETE /leases/1
  def destroy
    @lease.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lease
    @lease = Lease.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lease_params
    params.require(:lease).permit(:rent, :tenant_id, :apartment_id)
  end
end
