module API
  module V1
    class RentsController < ApiController
      include Wor::Paginate

      before_action :authenticate_user!

      def index
        render_paginated policy_scope(Rent), each_serializer: Rents::IndexSerializer
      end

      def create
        rent = Rent.new(rent_params)
        authorize rent
        rent.save!
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
