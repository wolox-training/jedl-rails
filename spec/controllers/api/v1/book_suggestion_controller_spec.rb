require 'rails_helper'

describe API::V1::BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    context 'When creating a valid book suggestion' do
      let!(:new_book_suggestion_attributes) { build(:book_suggestion).attributes }
      it 'creates a new book suggestion' do
        expect do
          post :create, params: { book_suggestion: new_book_suggestion_attributes }
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { book_suggestion: new_book_suggestion_attributes }
        expect(response).to have_http_status(:created)
      end
    end
  end
end

describe API::V1::BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    context 'When creating an invalid book suggestion' do
      let!(:new_book_suggestion_attributes) { build(:book_suggestion, user: nil).attributes }
      before do
        post :create, params: { book_suggestion: new_book_suggestion_attributes }
      end

      it 'doesn\'t create a new book suggestion' do
        expect do
          post :create, params: { book_suggestion: new_book_suggestion_attributes }
        end.to change { BookSuggestion.count }.by(0)
      end

      it 'returns error messages' do
        expect(response.body['error']).to be_present
      end
    end
  end
end
