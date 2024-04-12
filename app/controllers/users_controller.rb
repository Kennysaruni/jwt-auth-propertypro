class UsersController < ApplicationController
    skip_before_action :authorized, only:[:create]

    def index
        render json: {users: User.all}, status: :ok
    end

    # def create
    #     @user = User.create(user_params)
    #     if @user.valid?
    #       @token = encode_token(user_id: @user.id)
    #       render json: { user: UserSerializer.new(@user),jwt: @token }, status: :created
    #     else
    #       render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    #     end
    # end

    def create
        @user = User.create!(user_params)
        if @user
            if (params[:user_type] == 'Owner')
                @owner = Owner.create(user_id: @user.id, username: @user.username, email: @user.email)
                @token = encode_token({owner_id: @owner.id, user_id: @user.id})
                render json: {owner: OwnerSerializer.new(@owner), jwt: @token}, status: :created
            elsif(params[:user_type] == 'Tenant')
                @tenant = Tenant.create(user_id: @user.id, username:@user.username, email: @user.email)
                @token = encode_token({tenant_id: @tenant.id, user_id: @user.id})
                render json: {tenant: TenantSerializer.new(@tenant),jwt: @token}, status: :created
            else
                render json: {error: user.errors.full_messages}, status: :unprocessable_entity
            end
        end
    end

    # def profile
    #     render json: {user: UserSerializer.new(current_user)}, status: :accepted
    # end

    def profile
        if current_user
            render json: {owner: OwnerSerializer.new(current_user)}, status: :accepted
        elsif current_tenant
            render json: {tenant: TenantSerializer.new(current_tenant)}, status: :accepted
        end
    end
    
    private
    def user_params
      params.permit(:username, :password, :email, :user_type)
    end
end
