module API
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate

      before_action :authenticate_user!

      rescue_from ActiveRecord::RecordNotFound do
        render json: { error: "Book doesn't found" }
      end

      def index
        render_paginated Book, serializer: Books::IndexSerializer
      end

      def show
        book = Book.includes(:rents).find(params[:id])
        render json: book, serializer: Books::ShowSerializer
      end
    end
  end
end
