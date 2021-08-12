# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let(:user) { create :user }
  let(:post) { create :post }

  before do
    sign_in user
  end

  describe 'GET /index' do
    before do
      get post_comments_url(post)
    end

    it { expect(response).to have_http_status(:ok) }
  end

  describe 'GET /new' do
    before do
      get new_post_comment_url(post)
    end

    it { expect(response.body).not_to be_empty }
  end

  describe 'GET /show' do
    let(:comment) { create :comment, post_id: post.id }

    before do
      get post_comment_url(post, comment)
    end

    it { expect(response).to have_http_status(:ok) }
  end

  describe 'POST /create' do
    let(:post) { create :post }
    let(:params) do
      {
        comment: {
          body: 'Testing Comment'
        }
      }
    end

    before do
      post post_comments_path(post), params: params
    end

    it { expect(response).to have_http_status(:ok) }
  end

  describe 'PUT /update' do
    let(:post) { create :post }
    let(:comment) { create :comment, post_id: post.id }
    let(:params) do
      {
        comment: {
          body: 'Updated comment of post'
        }
      }
    end

    before do
      put "/posts/#{post.id}/comments/#{comment.id}", params: params
    end

    it { expect(response).to redirect_to(post_comment_url(post, comment)) }
  end

  describe 'DELETE /destory' do
    let(:post) { create :post }
    let(:comment) { create :comment, post_id: post.id }

    before do
      delete post_comment_url(post, comment)
    end

    it { expect(response).to redirect_to(post_comments_url) }
  end
end
