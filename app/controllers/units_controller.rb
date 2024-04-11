class UnitsController < ApplicationController
    def index
        render json: Unit.all
    end

    def create
        unit = Unit.create(unit_params)
        if unit.save
            render json: {unit: UnitSerializer.new(unit)}, status: :created
        else
            render json: {error: unit.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        unit = Unit.find_by(id: params[:id])
        if unit
            render json: {unit: UnitSerializer.new(unit)},status: :ok
        else
            render json: {error: 'Unit not found'}, status: :not_found
        end
    end

    private
    def unit_params
        params.require(:user).permit(:type,:rent_amount,:bedrooms,:bathrooms)
    end
end
