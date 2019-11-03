module Github
  Query = Github::Api::Client.parse <<-'GRAPHQL'
    query($query: String!, $limit: Int!) {
      search(query: $query, type: REPOSITORY, first: $limit) {
        edges {
          node {
            ... on Repository {
              url
              name
              description
              owner {
                login
              }
            }
          }
        }
      }
    }
  GRAPHQL
end
