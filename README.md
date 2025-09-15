# jhilmarch.github.io

Jonatan's blog on GitHub

## Development

Prereqs are provided by Nix. Enter the dev shell:

```
nix develop --command fish
```

Install Ruby gems and run Jekyll:

```
bundle install
bundle exec jekyll serve
```

## Linting

The dev shell includes several linters and formatters:

- Nix: alejandra
  - Format Nix files: `alejandra .`
- Markdown: mdl
  - Lint Markdown: `mdl .`
- YAML: yamllint
  - Lint YAML: `yamllint .`
  - Note: Jekyll uses YAML for `_config.yml` and for front matter in posts/pages, so YAML linting is relevant for this
    blog.
- Links: lychee
  - Check links (Markdown/HTML): `lychee --offline --verbose .`
  - Note: This complements `jekyll doctor`. Doctor checks your Jekyll setup and configuration, but it does not perform
    link checking.
- Formatting: Prettier (Markdown, HTML, YAML)
  - Check formatting: `prettier --check "**/*.{md,html,yml,yaml}"`
  - Format in-place: `prettier --write "**/*.{md,html,yml,yaml}"`
  - Config: `.prettierrc.yaml` with overrides for Markdown/HTML/YAML
  - Ignore: `.prettierignore` excludes `_site/`, `.bundle/`, `node_modules/`, etc.

Jekyll also has a built-in check: `bundle exec jekyll doctor`.
