class AuthController < ApplicationController
    skip_before_action :authorized, only:[:create]

    # def create
    #     @user = User.find_by(username: user_login_params[:username])
    #     if @user&& @user.authenticate(user_login_params[:password])
    #         token = encode_token({user_id: @user.id})
    #         render json: {user: UserSerializer.new(@user), jwt: token}, status: :accepted
    #     else
    #         render json: {error: 'Invalid username or password'}, status: :unauthorized
    #     end
    # end

    def create
        user = User.find_by(username: user_login_params[:username])
        if user&.authenticate(user_login_params[:password])
            if (user.user_type =="Owner")
                owner = Owner.find_by(user_id:user.id)
                if owner
                    token = encode_token({ owner_id: owner.id, user_id: user.id })
                    render json: { buyer: OwnerSerializer.new(owner), jwt: token }, status: :created
                else
                    render json: {errors:["Invalid Owner username or password"]}, status: :unauthorized
                end
            elsif((user.user_type =="Seller"))
                tenant = Tenant.find_by(user_id:user.id)
                if tenant
                    token = encode_token({ tenant_id: tenant.id, user_id: user.id })
                    render json: { seller: TenantSerializer.new(tenant), jwt: token }, status: :created
                else
                    render json: {errors:["Invalid Tenant username or password"]}, status: :unauthorized
                end
            else
                render json: {errors:["Wrong Credentials"]}, status: :not_found
            end
        else
        render json: {errors:["Wrong username or password"]}, status: :unprocessable_entity #422
        end
    end

    private
    def user_login_params
        params.permit(:username,:password)
    end
end
