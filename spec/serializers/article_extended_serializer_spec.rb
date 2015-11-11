require "rails_helper"

describe ArticleExtendedSerializer do
  let(:article) { build :article }
  let(:json) { ActiveModel::SerializableResource.serialize(article).to_json }
  let(:article_json) { parse_json(json) }

  it "returns article" do
    expect(article_json).to be_a_article_representation(article)
  end
end
