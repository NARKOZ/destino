# Destino

Web service to redirect to a Ruby gem's GitHub or RubyGems.org project page.

## Usage

Send a `GET` request to http://sla.herokuapp.com/ `<gem-name>`

Example:

```
GET http://sla.herokuapp.com/git-revision
```

## Developer Quick-Start

Destino is written in [Elixir](http://elixir-lang.org/) with usage of [Sugar
Framework](http://sugar-framework.github.io/). To run it you need Elixir 1.0+
installed.

```sh
git clone https://github.com/NARKOZ/destino.git
cd destino
mix do deps.get, deps.compile
```

When you're done, run the server:

```sh
mix server
```

To run test suite:

```sh
mix test
```

---

**Crafted specially for [Crank](https://github.com/NARKOZ/crank-for-rubygems)!**
