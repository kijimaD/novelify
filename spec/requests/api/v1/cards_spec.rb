require 'rails_helper'

RSpec.describe 'Card', type: :request do
  describe 'GET /api/v1/cards' do
    it '全てのcardを取得する' do
      create_list(:card, 10)

      get '/api/v1/cards'
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data'].length).to eq(10)
    end
  end

  describe 'GET /api/v1/cards/:id' do
    it '特定のcardを取得する' do
      card = create(:card, image: 'test-image')

      get "/api/v1/cards/#{card.id}"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data']['image']).to eq(card.image)
    end
  end

  describe 'POST /api/v1/cards' do
    it '新しいcardを作成する' do
      story = create(:story)
      valid_params = { image: 'image', story_id: story.id }

      expect { post '/api/v1/cards', params: { card: valid_params } }.to change(Card, :count).by(1)
      expect(response.status).to eq(200)
    end
  end

  describe 'PUT /api/v1/cards/:id' do
    it 'cardの編集を行う' do
      card = create(:card, image: 'old-image')

      put "/api/v1/cards/#{card.id}", params: { card: {image: 'new-image'}  }
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data']['image']).to eq('new-image')
   end
  end

  describe 'DELETE /api/v1/card/:id' do
    it 'cardを削除する' do
      card = create(:card)

      expect { delete "/api/v1/cards/#{card.id}" }.to change(Card, :count).by(-1)
      expect(response.status).to eq(200)
    end
  end
end
