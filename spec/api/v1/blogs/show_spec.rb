require "rails_helper"

RSpec.describe "blogs#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/blogs/#{blog.id}", params: params
  end

  describe "basic fetch" do
    let!(:blog) { create(:blog) }

    it "works" do
      expect(BlogResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("blogs")
      expect(d.id).to eq(blog.id)
    end
  end
end
