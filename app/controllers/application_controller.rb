class ApplicationController < ActionController::API
    before_action :authorized
    wrap_parameters format:[]
    # before_action :authorized_tenant

    def encode_token(payload)
        JWT.encode(payload, 'my_s3cr3t')
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end         
    end

    def current_user
        if decoded_token
            owner_id = decoded_token[0]['owner_id']
            @owner = Owner.find_by(id: owner_id)
        end
    end

    def current_tenant
        if decoded_token
            tenant_id = decoded_token[0]['tenant_id']
            @tenant = Tenant.find_by(id: tenant_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def tenant?
        !!current_tenant
    end

    def authorized
        render json: {message: 'Please log in'}, status: :unauthorized unless logged_in? || tenant?
    end

    def authorized_tenant
        render json: {error: 'Tenant Please log in'}, status: :unauthorized unless tenant?
    end
end
