defmodule GhManage.MixProject do
  use Mix.Project

  def project do
    [
      app: :gh_manage,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript(),
      releases: releases()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {GhManage.Application, []}
    ]
  end

  defp deps do
    [
      # HTTP client
      {:req, "~> 0.5"},
      
      # JSON
      {:jason, "~> 1.4"},
      
      # MCP protocol (stdio-based)
      # We'll implement this ourselves since there's no official Elixir MCP lib yet
      
      # Datalog engine
      {:datalogeon, "~> 0.1", github: "yourname/datalogeon", optional: true},
      # Fallback: we'll implement a simple one
      
      # CLI argument parsing
      {:optimus, "~> 0.5"},
      
      # Terminal UI (optional, for standalone mode)
      {:owl, "~> 0.11"},
      
      # Config file parsing
      {:toml, "~> 0.7"},
      
      # For similarity scoring (optional)
      {:string_compare, "~> 0.1", hex: :the_fuzz}
    ]
  end

  defp escript do
    [
      main_module: GhManage.CLI,
      name: "gh-manage"
    ]
  end

  defp releases do
    [
      gh_manage: [
        steps: [:assemble, :tar]
      ]
    ]
  end
end
