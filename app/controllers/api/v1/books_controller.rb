module API
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate

      before_action :authenticate_user!

      def index
        books = Book.all

        render_paginated books, serializer: Books::IndexSerializer
      end

      def show
        book = Book.includes(:rents).find(params[:id])

        render json: book, serializer: Books::ShowSerializer
      end
    end
  end
end
