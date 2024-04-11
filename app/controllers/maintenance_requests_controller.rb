class MaintenanceRequestsController < ApplicationController
    def index
        render json: MaintenanceRequest.all
    end

    def create
        maintenance_request = MaintenanceRequest.create(maintenance_request_params)
        if maintenance_request.save
            render json: {maintenance_request: MaintenanceRequestSerializer.new(maintenance_request)},status: :created
        else
            render json: {error: 'Maintenance request could not be created'}, status: :unprocessable_entity
        end
    end

    def show
        maintenance_request = MaintenanceRequest.find_by(id: params[:id])
        if maintenance_request
            render json : {maintenance_request: MaintenanceRequestSerializer.new(maintenance_request)}, status: :ok
        else
            render json: {error: 'Maintainance request not found'},status: :not_found
        end
    end

    private
    def maintenance_request_params
        params.require(:user).permit(:title,:description,:status,:priority)
    end
end
