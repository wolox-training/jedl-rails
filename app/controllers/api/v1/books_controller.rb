module API
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate

      before_action :authenticate_user!

      def index
        books = Book.all

        render_paginated books
      end

      def show
        begin
          book = Book.find(params[:id])

          render json: book
        rescue
          render json: { error: "Book doesn't found" }
        end
      end
    end
  end
end
