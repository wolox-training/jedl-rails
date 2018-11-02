module API
  module V1
    class RentsController < ApplicationController
      include Wor::Paginate

      before_action :authenticate_user!

      def index
        rents = Rent.where(user: params[:user_id])
        render_paginated rents, each_serializer: Rents::IndexSerializer
      end

      def create
        rent = Rent.new(params.require(:rent)
                        .permit(:start_date, :end_date, :book_id, :user_id, :returned_at))

        if rent.save
          render json: rent, serializer: Rents::CreateSerializer, status: :created
        else
          render json: rent.errors
        end
      end
    end
  end
end
