class AdminController < ApplicationController
    include ApplicationHelper
    before_action :is_loggedin?

    def show
        @admin = Admin.find(params[:id])
    end

    def index
        @admins = Admin.all
        @admin = Admin.new
    end
end
