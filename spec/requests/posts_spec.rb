# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { create :user }

  before do
    sign_in user
  end

  describe 'GET /index' do
    before do
      get posts_url
    end

    it { expect(response).to have_http_status(:ok) }
  end

  describe 'GET /new' do
    before do
      get new_post_url
    end

    it { expect(response.body).not_to be_empty }
  end

  describe 'GET /show' do
    let(:post) { create :post }

    before do
      get post_url(post.id)
    end

    it { expect(response).to have_http_status(:ok) }
  end

  describe 'POST /create' do
    let(:user) { create :user }
    let(:params) do
      {
        post: {
          title: 'New',
          description: 'Testing Comment',
          user_id: user.id
        }
      }
    end

    before do
      post '/posts', params: params
    end

    it { expect(response).to redirect_to(post_url(Post.last.id)) }
  end

  describe 'PUT /update' do
    let(:post) { create :post }
    let(:params) do
      {
        post: {
          title: 'Updated Title'
        }
      }
    end

    before do
      put "/posts/#{post.id}", params: params
    end

    it { expect(response).to redirect_to(post_url(Post.last.id)) }
  end

  describe 'DELETE /destory' do
    let(:post) { create :post }

    before do
      delete "/posts/#{post.id}"
    end

    it { expect(response).to redirect_to(posts_url) }
  end
end
