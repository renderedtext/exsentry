defmodule ExSentry.Mixfile do
  use Mix.Project

  def project do
    [app: :exsentry,
     version: "0.2.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [
       "coveralls": :test,
       "coveralls.detail": :test,
       "coveralls.post": :test
     ],
     description: "ExSentry is a client for the Sentry error reporting platform.",
     package: [
       maintainers: ["pete gamache", "Appcues"],
       licenses: ["MIT"],
       links: %{GitHub: "https://github.com/appcues/exsentry"}
     ],
     docs: [main: ExSentry],
     deps: deps]
  end

  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [
        :logger,
        :fuzzyurl,
        :uuid,
        :timex,
        :httpotion,
        :poison,
        :plug,
      ],
      mod: {ExSentry, []}]
  end

  defp deps do
    [
      {:fuzzyurl, "~> 0.8"},
      {:uuid, "~> 1.1"},
      {:timex, "~> 2.1.0"},
      {:ibrowse, "~> 4.2.2", [hex: :ibrowse]},
      {:httpotion, "~> 2.1"},
      {:poison, "~> 1.5"},
      {:plug, "~> 1.0"},
      {:ex_spec, "~> 1.0.0", only: :test},
      {:mock, "~> 0.1.1", only: :test},
      {:excoveralls, "~> 0.4.3", only: :test},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
    ]
  end
end
