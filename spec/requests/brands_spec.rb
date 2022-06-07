require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/brands", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Brand. As you add validations to Brand, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Brand.create! valid_attributes
      get brands_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      brand = Brand.create! valid_attributes
      get brand_url(brand)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_brand_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      brand = Brand.create! valid_attributes
      get edit_brand_url(brand)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Brand" do
        expect {
          post brands_url, params: { brand: valid_attributes }
        }.to change(Brand, :count).by(1)
      end

      it "redirects to the created brand" do
        post brands_url, params: { brand: valid_attributes }
        expect(response).to redirect_to(brand_url(Brand.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Brand" do
        expect {
          post brands_url, params: { brand: invalid_attributes }
        }.to change(Brand, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post brands_url, params: { brand: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested brand" do
        brand = Brand.create! valid_attributes
        patch brand_url(brand), params: { brand: new_attributes }
        brand.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the brand" do
        brand = Brand.create! valid_attributes
        patch brand_url(brand), params: { brand: new_attributes }
        brand.reload
        expect(response).to redirect_to(brand_url(brand))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        brand = Brand.create! valid_attributes
        patch brand_url(brand), params: { brand: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested brand" do
      brand = Brand.create! valid_attributes
      expect {
        delete brand_url(brand)
      }.to change(Brand, :count).by(-1)
    end

    it "redirects to the brands list" do
      brand = Brand.create! valid_attributes
      delete brand_url(brand)
      expect(response).to redirect_to(brands_url)
    end
  end
end
