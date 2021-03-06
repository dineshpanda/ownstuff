require "rails_helper"

RSpec.describe BlogResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "blogs",
          attributes: attributes_for(:blog),
        },
      }
    end

    let(:instance) do
      BlogResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      end.to change { Blog.count }.by(1)
    end
  end

  describe "updating" do
    let!(:blog) { create(:blog) }

    let(:payload) do
      {
        data: {
          id: blog.id.to_s,
          type: "blogs",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      BlogResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { blog.reload.updated_at }
      # .and change { blog.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:blog) { create(:blog) }

    let(:instance) do
      BlogResource.find(id: blog.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Blog.count }.by(-1)
    end
  end
end
