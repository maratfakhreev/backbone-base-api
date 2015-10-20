class ArticlesPaginatedArraySerializer < PaginatedArraySerializer
  def initialize(objects, options = {})
    options[:serializer] = ArticleExtendedSerializer

    super(objects, options)
  end
end
