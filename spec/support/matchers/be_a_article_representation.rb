RSpec::Matchers.define :be_a_article_representation do |article|
  match do |json|
    response_attributes = article.sliced_attributes %w(
      id
      title
      comments_count
    )

    expect(json).to be
    expect(json).to include_attributes(response_attributes)
  end
end
