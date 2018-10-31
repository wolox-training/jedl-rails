module API
    module V1
        class RentsController < ApplicationController
            include Wor::Paginate

            before_action :authenticate_user!, :get_user

            @user = nil

            def index
                rents = Rent.includes(:user).where(user: @user)

                render_paginated rents
            end

            private

            def get_user
                if params.has_key?(:user_id)
                    begin
                        @user = User.find(params[:user_id])
                    rescue ActiveRecord::RecordNotFound
                        render json: { error: "User doesn't found" }
                    end
                end
            end
        end
    end
end
