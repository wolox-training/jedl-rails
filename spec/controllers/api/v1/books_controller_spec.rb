require 'rails_helper'
require './spec/helpers/authenticate_helper'

describe API::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the books' do
      let!(:books) { create_list(:book, 3) }

      before do
        get :index
      end

      it 'responses with the books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, serializer: Books::IndexSerializer
        ).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

describe API::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the books paginated' do
      let!(:books) { create_list(:book, 28) }

      before do
        get :index, params: { page: 2 }
      end

      it 'responses with the books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, serializer: Books::IndexSerializer
        ).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

describe API::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the books paginated by inexistent page' do
      let!(:books) { create_list(:book, 2) }

      before do
        get :index, params: { page: 2 }
      end

      it 'responses with the empty pager json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, serializer: Books::IndexSerializer
        ).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

describe API::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #show' do
    context 'When fetching a book' do
      let!(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responses with the book json' do
        expect(response.body).to eq Books::ShowSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

describe API::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #show' do
    context 'When fetching an inexistent book' do
      subject { { error: "Couldn't find Book with 'id'=1" } }

      before do
        get :show, params: { id: 1 }
      end

      it 'responses with the book json' do
        expect(response.body).to eq subject.to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
