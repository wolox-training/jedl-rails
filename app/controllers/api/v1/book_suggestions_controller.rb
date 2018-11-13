module API
  module V1
    class BookSuggestionsController < ApiController
      def create
        render json: BookSuggestion.create!(book_suggestion_params), status: :created
      end

      private

      def book_suggestion_params
        params.require(:book_suggestion)
              .permit(:author, :title, :link, :editor, :user_id, :year, :synopsis, :price)
      end
    end
  end
end
