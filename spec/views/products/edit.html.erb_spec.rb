require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      name: "MyString",
      description: "MyText",
      published: false,
      image: "MyString",
      brand: nil
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[published]"

      assert_select "input[name=?]", "product[image]"

      assert_select "input[name=?]", "product[brand_id]"
    end
  end
end
