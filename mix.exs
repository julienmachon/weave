defmodule Weave.Mixfile do
  use Mix.Project

  def project do
    [ app: :weave,
      version: "2.2.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env),
      aliases: aliases(),
      description: description(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      docs: [main: "readme", extras: ["README.md"]]
    ]
  end

  def application do
    [ applications: [
      :logger
    ] ]
  end

  def deps do
    [ {:ex_doc, ">= 0.0.0", only: :dev},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:excoveralls, "~> 0.4", only: :test},
      {:cabbage, "~> 0.3.1", only: :test}
    ]
  end

  def aliases do
    [ "init": ["local.hex --force", "deps.get"],
      "test": ["test"]
    ]
  end

  defp description do
    """
    A just-in-time configuration loader for Elixir projects.
    """
  end

  defp package do
    [ name: :weave,
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["GT8Online"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/GT8Online/weave"}]
  end

  defp elixirc_paths(:dev),   do: ["lib"]
  defp elixirc_paths(:test),  do: ["test", "test/support"] ++ elixirc_paths(:dev)
  defp elixirc_paths(_),      do: ["lib"]
end
