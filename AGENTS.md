# dotcom

Personal Jekyll site (`www.nateberkopec.com`).

## Test Setup

The test suite mirrors the Speedshop structure:

- `test/ruby/` — Minitest unit tests for Jekyll plugins
- `test/integration/site_test.rb` — HTTP smoke tests against the built site
- `test/integration/link_integrity_test.rb` — full built-site link/resource/anchor validation

### Commands

```bash
bundle exec rake test:ruby
bundle exec rake test:integration
bundle exec rake test
```

Or with mise:

```bash
mise run test:ruby
mise run test:integration
mise run test
```

### Link Integrity Rules

`test/integration/link_integrity_test.rb` checks the built `_site` output and verifies:

- all internal and external links/resources (anchors, images, scripts, stylesheets, forms, media)
- fragment anchors (`#id`) resolve to existing elements
- redirects are allowed
- `mailto:` and `tel:` are syntax-validated only
- external checks retry 3 times, then hard-fail
- requests are parallelized with `Concurrent::ThreadPoolExecutor` (pool size: 25)

### Local Test Server

Integration tests build `_site` and start a local static server automatically on `127.0.0.1` using port `0` (ephemeral).
The assigned port is discovered at runtime and used by the test helpers.
Set `BASE_URL` to run against a specific target instead.
