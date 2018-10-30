module API
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate

      before_action :authenticate_user!

      def index
        render_paginated Book, serializer: Books::IndexSerializer
      end

      def show
<<<<<<< HEAD
        book = Book.includes(:rents).find(params[:id])
        render json: book, serializer: Books::ShowSerializer
=======
        book = Book.find(params[:id])

        render json: book
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Book doesn't found" }
>>>>>>> UPDATE
      end
    end
  end
end
