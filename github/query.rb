module Github
  Query = Github::Api::Client.parse <<-'GRAPHQL'
    search(query: $query, type: REPOSITORY, first: $limit) {
      edges {
        node {
          ... on Repository {
            url
            name
            description
          }
        }
      }
    }
  GRAPHQL
end
