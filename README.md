# Docuzaurus + Typesense template

- [Docuzaurus](https://docusaurus.io/)
- [Typesense](https://typesense.org/)
- Typesense docs scraper
- Gitlab pipeline
- Github workflow

## Using template

```
$ git clone git@github.com:highglossy/docuzaurus-typesense-template.git my-docs
$ cd my-docs
$ yarn
```

## Setup Docuzaurus

Everything you need is on the [Docuzaurus documentation](https://docusaurus.io/docs/installation)

## Setup Typesense

### `docuzaurus.config.ts` modifications

Make sure you have the following in your `docuzaurus.config.ts`

```ts
const config: Config = {
...
themes: ['docusaurus-theme-search-typesense'],
...
  themeConfig: {
    ...

    typesense: {
      // Replace this with the name of your index/collection.
      // It should match the "index_name" entry in the scraper's "config.json" file.
      typesenseCollectionName: "__replace_with_your_index_name__",

      typesenseServerConfig: {
        nodes: [
          {
            host: process.env.HOST || "localhost",
            port: process.env.PORT || 443,
            protocol: process.env.PORT === "443" ? "https" : "http",
          },
        ],
        apiKey: process.env.TYPESENSE_API_KEY,
      },
      typesenseSearchParameters: {},
      contextualSearch: true,
    }
  }

}
```

Replace your project details
`typesenseCollectionName: "__replace_with_your_index_name__",`

### Edit `typesense.config.json`

Replace your project details

```json
{
  "index_name": "__replace_with_your_index_name__",
  "start_urls": ["https://your-published-docs-url.com"],
  "sitemap_urls": ["https://your-published-docs-url.com/sitemap.xml"],
...
}
```

### Add `.env` file

```sh
TYPESENSE_API_KEY=xyz
# If you are using docker or want to override the host
# TYPESENSE_HOST=host.docker.internal
# TYPESENSE_HOST=your-domain.com
PORT=3001
```

## Local Development

```
$ yarn start
```

This command starts a local development server and opens up a browser window. Most changes are reflected live without having to restart the server.

### Build

```
$ yarn build
```

This command generates static content into the `build` directory and can be served using any static contents hosting service.

### Deployment
