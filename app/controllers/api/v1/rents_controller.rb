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
        rent = Rent.create!(rent_params)
        SendMailWorker.perform_async(rent.id)
        render json: rent, serializer: Rents::CreateSerializer, status: :created
      end

      private

      def rent_params
        params.require(:rent)
              .permit(:start_date, :end_date, :book_id, :user_id, :returned_at)
      end
    end
  end
end
