# Brandfolder Advanced Search
An example of an app using our Advanced Search API to generate a view of assets. 

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

You can optionally set environment variables to override the user options:
```yml
BF_API_KEY: 'YOUR_API_TOKEN_HERE'
BF_URLS: 'https://brandfolder.com/YOUR_BRANDFOLDER_SLUG, https://brandfolder.com/YOUR_BRANDFOLDER_SLUG2, https://brandfolder.com/YOUR_BRANDFOLDER_SLUG3'
LOCKUP_CODEWORD: 'SIMPLE_PASSWORD'
BF_EXACT_MATCH: 'true'
PER_PAGE: 1000
```

Find your API Token here: https://brandfolder.com/settings