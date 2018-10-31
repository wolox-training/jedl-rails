module API
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate

      before_action :authenticate_user!

      rescue_from ActiveRecord::RecordNotFound do
        render json: { error: "Book doesn't found" }
      end

      def index
        books = Book.all

        render_paginated books
      end

      def show
        book = Book.find(params[:id])

        render json: book
      end
    end
  end
end
