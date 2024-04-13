class LeasesController < ApplicationController
    def index
        render json: Lease.all
    end

    # def create
    #     owner = current_user
    #     lease = owner.leases.create!(lease_params)
    #     if lease.save
    #         render json: {lease: LeaseSerializer.new(lease)},status: :created
    #     else
    #         render json: {error: 'Could not create lease'}, status: :unprocessable_entity
    #     end
    # end

    
    def create
        # unit = Unit.find(params[:unit_id])
        # tenant = Tenant.find(params[:tenant_id])
        owner = current_user
        lease = owner.leases.create!(params.permit(:tenant_id, :unit_id))
        # lease = Lease.create(lease_params)
        if lease.save
          render json: { lease: LeaseSerializer.new(lease) }, status: :created
        else
          render json: { error: lease.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # def create
    #     unit = Unit.find(params[:unit_id])
    #     tenant = Tenant.find(params[:tenant_id])
      
    #     lease = Lease.new(lease_params.merge(unit: unit, tenant: tenant))
      
    #     if lease.save
    #       render json: { lease: LeaseSerializer.new(lease) }, status: :created
    #     else
    #       render json: { error: lease.errors.full_messages }, status: :unprocessable_entity
    #     end
    # end

    def show
        lease = Lease.find_by(id: params[:id])
        if lease
            render json:{lease: LeaseSerializer.new(lease)}, status: :ok
        else
            render json: {error: 'Lease not found'}, status: :not_found
        end
    end

    private
    def lease_params
        params.permit(:tenant_id, :unit_id)
    end
end
