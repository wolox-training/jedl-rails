module API
  module V1
    class BooksController < ApiController
      include Wor::Paginate

      before_action :authenticate_user!

      def index
        render_paginated policy_scope(Book), serializer: Books::IndexSerializer
      end

      def show
        book = Book.includes(:rents).find(params[:id])
        render json: book, serializer: Books::ShowSerializer
      end

      def search
        book = OpenLibraryService.new.book_info(params[:search])
        render json: book
      end
    end
  end
end
