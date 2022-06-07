require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        name: "Name",
        description: "MyText",
        published: false,
        image: "Image",
        brand: nil
      ),
      Product.create!(
        name: "Name",
        description: "MyText",
        published: false,
        image: "Image",
        brand: nil
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "Image".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
