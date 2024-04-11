class TenantsController < ApplicationController
    skip_before_action :authorized

    def index
        render json: Tenant.all
    end
end
