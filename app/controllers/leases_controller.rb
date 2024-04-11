class LeasesController < ApplicationController
    def index
        render json: Lease.all
    end

    def create
        lease = Lease.create(lease_params)
        if lease.save
            render json: {lease: LeaseSerializer.new(lease)},status: :created
        else
            render json: {error: 'Could not create lease'}, status: :unprocessable_entity
        end
    end

    def show
        lease = Lease.find_by(params[:id])
        if lease
            render json :{lease: LeaseSerializer.new(lease)}, status: :ok
        else
            render json : {error: 'Lease not found'}, status: :not_found
        end
    end

    private
    def lease_params
        params.require(:user).permit(:tenant_id, :unit_id)
    end
end
