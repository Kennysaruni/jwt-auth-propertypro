class MaintenanceRequestsController < ApplicationController
    def index
        render json: MaintenanceRequest.all
    end

    # def create
    #     @unit = Unit.find_by(id: params[:unit_id])
    #     # tenant = current_tenant
    #     maintenance_request = @unit.maintenance_requests.create(maintenance_request_params)
    #     if maintenance_request.save
    #         render json: {maintenance_request: MaintenanceRequestSerializer.new(maintenance_request)},status: :created
    #     else
    #         render json: {error: 'Maintenance request could not be created'}, status: :unprocessable_entity
    #     end
    # end

    def create
        tenant = current_tenant
        maintenance_request = tenant.maintenance_requests.create!(maintenance_request_params)
        if maintenance_request.save
            render json: {maintenance_request: MaintenanceRequestSerializer.new(maintenance_request)},status: :created
        else
            render json: {error: maintenance_requests.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        maintenance_request = MaintenanceRequest.find_by(id: params[:id])
        if maintenance_request
            render json: {maintenance_request: MaintenanceRequestSerializer.new(maintenance_request)}, status: :ok
        else
            render json: {error: 'Maintainance request not found'},status: :not_found
        end
    end

    private
    def maintenance_request_params
        params.permit(:title,:description,:status,:priority,:unit_id)
    end
end
