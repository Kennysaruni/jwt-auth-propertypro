class PropertiesController < ApplicationController

    def index
        render json: Property.all
    end

    def create
        property = Property.create(property_params)
        if property.save
            render json: {property: PropertySerializer.new(property)}, status: :created
        else
            render json: {error: property.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        property = Property.find_by(id: params[:id])
        if property
            render json: {property: PropertySerializer.new(property)}, status: :ok
        else
            render json: {error: 'Property not found'}, status: :not_found
        end
    end

    private
    def property_params
        params.require(:user).permit(:property_name,:location)
    end
end
