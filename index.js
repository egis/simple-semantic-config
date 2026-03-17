module.exports = {
  plugins: [
    [
      '@semantic-release/commit-analyzer',
      {
        preset: 'angular',
        releaseRules: [
          {
            type: 'docs',
            release: 'patch',
          },
          {
            type: 'chore',
            release: 'patch',
          },
          {
            type: 'refactor',
            release: 'patch',
          },
          {
            type: 'build',
            release: 'patch',
          },
          {
            message: '/BREAKING CHANGE/',
            release: 'major',
          },
        ],
      },
    ],
    '@semantic-release/release-notes-generator',
    '@semantic-release/npm',
    ['@semantic-release/github',
      {
        successComment: false
      }
    ],
  ],
};
