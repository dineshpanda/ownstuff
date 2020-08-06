require 'rails_helper'

RSpec.describe "blogs#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/blogs/#{blog.id}", payload
  end

  describe 'basic update' do
    let!(:blog) { create(:blog) }

    let(:payload) do
      {
        data: {
          id: blog.id.to_s,
          type: 'blogs',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(BlogResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { blog.reload.attributes }
    end
  end
end
