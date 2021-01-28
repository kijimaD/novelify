require 'rails_helper'

RSpec.describe 'Story', type: :request do
  describe 'GET /api/v1/stories' do

    it '全てのstoryを取得する' do
      create_list(:story, 10)
  
      get '/api/v1/stories'
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data'].length).to eq(10)
    end
  end

  describe 'GET /api/v1/stories/:id' do
    it '特定のstoryを取得する' do
      story = create(:story, title: 'test-title')
  
      get "/api/v1/stories/#{story.id}"
      json = JSON.parse(response.body)
  
      expect(response.status).to eq(200)
      expect(json['data']['title']).to eq(story.title)
    end
  end

  describe 'POST /api/v1/stories' do
    it '新しいstoryを作成する' do
      valid_params = { title: 'title' }

      expect { post '/api/v1/stories', params: { story: valid_params } }.to change(Story, :count).by(1)
      expect(response.status).to eq(200)
    end
  end

  describe 'PUT /api/v1/stories/:id' do
    it 'storyの編集を行う' do
      story = create(:story, title: 'old-title')
  
      put "/api/v1/stories/#{story.id}", params: { story: {title: 'new-title'}  }
      json = JSON.parse(response.body)
  
      expect(response.status).to eq(200)
      expect(json['data']['title']).to eq('new-title')
   end
  end

  describe 'DELETE /api/v1/stories/:id' do
    it 'storyを削除する' do
      story = create(:story)

      expect { delete "/api/v1/stories/#{story.id}" }.to change(Story, :count).by(-1)
      expect(response.status).to eq(200)
    end
  end
end