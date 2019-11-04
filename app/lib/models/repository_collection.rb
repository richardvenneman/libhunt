# frozen_string_literal: true

class RepositoryCollection
  def initialize(*repositories)
    @repositories = repositories.flatten
  end

  def sorted
    @repositories.sort_by(&:updated_at).reverse.collect(&:to_h)
  end
end
