require "rails_helper"

RSpec.describe "blogs#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/blogs", params: params
  end

  describe "basic fetch" do
    let!(:blog1) { create(:blog) }
    let!(:blog2) { create(:blog) }

    it "works" do
      expect(BlogResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["blogs"])
      expect(d.map(&:id)).to match_array([blog1.id, blog2.id])
    end
  end
end
