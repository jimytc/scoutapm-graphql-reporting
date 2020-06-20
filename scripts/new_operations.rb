# frozen_string_literal: true

NEW_OPERATIONS = {
  QUERY_POSTS_AUTHORS: {
    operationName: 'posts_authors',
    query: 'query posts_authors{ posts { edges { node { title rating } } } authors { edges { node { name age } } } }'
  },

  QUERY_AUTHORS_POSTS: {
    operationName: 'authors_posts',
    query: 'query authors_posts{ authors { edges { node { name age } } } posts { edges { node { title rating } } } }'
  },

  QUERY_POSTS_COMMENTS: {
    operationName: 'posts_comments',
    query: 'query posts_comments{ posts { edges { node { title rating } } } comments { edges { node { body } } } }'
  },

  QUERY_COMMENTS_POSTS: {
    operationName: 'comments_posts',
    query: 'query comments_posts{ comments { edges { node { body } } } posts { edges { node { title rating } } } }'
  },

  QUERY_AUTHORS_COMMENTS: {
    operationName: 'authors_comments',
    query: 'query authors_comments{ authors { edges { node { name age } } } comments { edges { node { body } } } }'
  },

  QUERY_COMMENTS_AUTHORS: {
    operationName: 'comments_authors',
    query: 'query comments_authors{ comments { edges { node { body } } } authors { edges { node { name age } } } }'
  },
}.freeze
