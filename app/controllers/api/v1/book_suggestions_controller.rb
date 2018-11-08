module API
  module V1
    class BookSuggestionsController < ApiController
      def create
        book_suggestion = BookSuggestion.create!(book_suggestion_params)
        render json: book_suggestion, status: :created
      end

      private

      def book_suggestion_params
        params.require(:book_suggestion)
              .permit(:author, :title, :link, :editor, :user_id, :year, :synopsis, :price)
      end
    end
  end
end
