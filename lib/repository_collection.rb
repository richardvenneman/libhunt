class RepositoryCollection
  def initialize(repositories)
    @repositories = repositories
  end

  def sorted
    @repositories.sort_by(&:updated_at).reverse.collect(&:to_h)
  end
end
