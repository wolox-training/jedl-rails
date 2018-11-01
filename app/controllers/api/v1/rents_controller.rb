module API
  module V1
    class RentsController < ApplicationController
      include Wor::Paginate

      before_action :authenticate_user!, :find_user

      @user = nil

      @book = nil

      def index
        rents = Rent.where(user: @user)
        render_paginated rents, each_serializer: Rents::IndexSerializer
      end

      def create
        rent = Rent.create(parse_create_rent)

        if rent.valid?
          render json: rent, serializer: Rents::CreateSerializer
        else
          render json: rent.errors
        end
      end

      private

      def find_user
        @user = User.find(params[:user_id])
      end

      def parse_create_rent
        rent = params[:rent].clone
        rent[:start_date] = rent.delete :from
        rent[:end_date] = rent.delete :to
        rent.permit!
      end
    end
  end
end
