class PropertiesController < ApplicationController

    def index
        render json: Property.all
    end

    def create
        Rails.logger.debug "Received params: #{params.inspect}"
        owner = current_user
        property = owner.properties.create!(property_params.except(:images))
        images = params[:property][:images]

        if images
            images.each do |image|
                property.images.attach(image)
            end
        end

        if property.save
            render json: {property: PropertySerializer.new(property)}, status: :created
        else
            render json: {error: property.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        property = Property.find_by(id: params[:id])

        if property
            # Collect URLs of attached images
            image_urls = property.images.map { |image| url_for(image) }

            # Render property with serialized data and image URLs
            render json: {
                property: PropertySerializer.new(property).as_json.merge(images: image_urls)
            }, status: :ok
        else
            render json: { error: 'Property not found' }, status: :not_found
        end
    end


    private
    def property_params
        params.require(:property).permit(:property_name,:location, images: [])
    end
end
