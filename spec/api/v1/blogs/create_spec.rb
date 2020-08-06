require 'rails_helper'

RSpec.describe "blogs#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/blogs", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:blog)
    end
    let(:payload) do
      {
        data: {
          type: 'blogs',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(BlogResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Blog.count }.by(1)
    end
  end
end
