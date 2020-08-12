class UsersController < ApplicationController
    before_action :find_user, only: [:show, :destroy]
    def show; end

    def destroy
        @user.destroy
        redirect_to recipes_path
    end

    private

    def find_user
        @user = User.find(params[:id])
    end
end
