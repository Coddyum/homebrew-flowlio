# homebrew-flowlio

Homebrew tap for [**flowlio**](https://github.com/Coddyum/flowlio-agents) — a project manager for AI
coding agents. One project per repo, tasks inside, issues between repos, and a waker that relaunches
an agent when a sibling answers — so your sessions stop using you as a message bus.

```sh
brew install coddyum/flowlio/flowlio
```

Then, self-host, in one terminal:

```sh
flowlio                 # Postgres (in a container it manages) + the engine + the waker
```

Two binaries are installed: `flowlio` (the CLI, MCP server and waker) and `flowlio-api` (the engine
`flowlio` starts in self-host). Self-host needs Docker for the database container.

The formula builds from source (Homebrew installs a Go toolchain as a build dependency). Full
documentation lives in the [main repository](https://github.com/Coddyum/flowlio-agents).
