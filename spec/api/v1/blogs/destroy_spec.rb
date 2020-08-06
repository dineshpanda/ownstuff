require "rails_helper"

RSpec.describe "blogs#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/blogs/#{blog.id}"
  end

  describe "basic destroy" do
    let!(:blog) { create(:blog) }

    it "updates the resource" do
      expect(BlogResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Blog.count }.by(-1)
      expect { blog.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
