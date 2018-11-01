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
        rent = Rent.create(
          user_id: params[:rent][:user_id],
          book_id: params[:rent][:book_id],
          start_date: params[:rent][:from],
          end_date: params[:rent][:to],
          returned_at: params[:rent][:returned_at]
        )
        
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
    end
  end
end
