# frozen_string_literal: true

OPERATIONS = {
  QUERY_EVERYTHING: {
    operationName: 'everything',
    query: 'query everything{ posts { edges { node { title rating } } } authors { edges { node { name age } } } comments { edges { node { body } } } }'
  },

  QUERY_POSTS: {
    operationName: 'posts',
    query: 'query posts{ posts { edges { node { title rating } } } }'
  },

  QUERY_AUTHORS: {
    operationName: 'authors',
    query: 'query authors{ authors { edges { node { name age } } } }'
  },

  QUERY_COMMENTS: {
    operationName: 'comments',
    query: 'query comments{ comments { edges { node { body } } } }'
  },

  MUTATION_POST: {
    operationName: 'updatePost',
    query: 'mutation updatePost($input: UpdatePostMutationInput!) { updatePost(input: $input) { post { title rating } } }',
    variables: { input: { title: SecureRandom.hex } }
  },

  MUTATION_AUTHOR: {
    operationName: 'updateAuthor',
    query: 'mutation updateAuthor($input: UpdateAuthorMutationInput!) { updateAuthor(input: $input) { author { name age } } }',
    variables: {
      input: {
        name: SecureRandom.hex
      }
    }
  },

  MUTATION_COMMENT: {
    operationName: 'updateComment',
    query: 'mutation updateComment($input: UpdateCommentMutationInput!) { updateComment(input: $input) { comment { body } } }',
    variables: { input: { body: SecureRandom.hex(64) } }
  },
}.freeze
