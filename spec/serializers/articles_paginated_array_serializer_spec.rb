require "rails_helper"

describe ArticlesPaginatedArraySerializer do
  let(:total) { 20 }
  let(:per_page) { 10 }
  let(:page) { 1 }

  let(:user) { build_stubbed :user }
  let(:articles) { Kaminari.paginate_array(build_list(:article, total, user: user)).page(page).per(per_page) }
  let(:parsed_json) { parse_json(json) }
  let(:json) do
    ActiveModel::SerializableResource.serialize(
      articles,
      serializer: ArticlesPaginatedArraySerializer,
      adapter: :json
    ).to_json
  end

  it "returns json with meta" do
    expect(parsed_json).to include("meta")
  end

  it "returns meta with pagination info" do
    expect(parsed_json["meta"]).to include("pagination")

    expect(parsed_json["meta"]["pagination"]["total"]).to eq(total)
    expect(parsed_json["meta"]["pagination"]["per_page"]).to eq(per_page)
    expect(parsed_json["meta"]["pagination"]["page"]).to eq(page)
  end
end
