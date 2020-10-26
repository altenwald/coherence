defmodule Coherence.Mixfile do
  use Mix.Project

  @version "0.6.0"

  def project do
    [
      app: :coherence,
      version: @version,
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      docs: [extras: ["README.md"], main: "Coherence"],
      deps: deps(),
      package: package(),
      dialyzer: [plt_add_apps: [:mix]],
      name: "Coherence",
      description: """
      A full featured, configurable authentication and user management system for Phoenix.
      """
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: {Coherence, []},
      extra_applications: [:logger, :tzdata]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_), do: ["lib", "web"]

  defp deps do
    [
      {:ecto_sql, "~> 3.5"},
      {:bcrypt_elixir, "~> 2.2"},
      {:phoenix, "~> 1.5"},
      {:phoenix_html, "~> 2.14"},
      {:gettext, "~> 0.18"},
      {:elixir_uuid, "~> 1.2"},
      {:phoenix_swoosh, "~> 0.3"},
      {:timex, "~> 3.6"},
      {:floki, "~> 0.29", only: :test},
      {:ex_doc, "~> 0.23", only: :dev},
      {:earmark, "~> 1.4", only: :dev, override: true},
      {:postgrex, ">= 0.0.0", only: :test},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:credo, "~> 1.4", only: [:dev, :test]},
      {:plug, "~> 1.10"},
      {:jason, "~> 1.2"}
    ]
  end

  defp package do
    [
      maintainers: ["Stephen Pallen"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/smpallen99/coherence"},
      files: ~w(lib priv README.md mix.exs LICENSE)
    ]
  end
end
