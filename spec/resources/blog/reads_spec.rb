require "rails_helper"

RSpec.describe BlogResource, type: :resource do
  describe "serialization" do
    let!(:blog) { create(:blog) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(blog.id)
      expect(data.jsonapi_type).to eq("blogs")
    end
  end

  describe "filtering" do
    let!(:blog1) { create(:blog) }
    let!(:blog2) { create(:blog) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: blog2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([blog2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:blog1) { create(:blog) }
      let!(:blog2) { create(:blog) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      blog1.id,
                                      blog2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      blog2.id,
                                      blog1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
