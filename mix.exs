defmodule UeberauthHatena.MixProject do
  use Mix.Project

  def project do
    [
      app: :ueberauth_hatena,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Hatena strategy  for Ueberauth.",
      package: [
        maintainers: ["h3poteto"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/h3poteto/ueberauth_hatena"}
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:oauther, "~> 1.1"},
      {:ueberauth, "~> 0.6"},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false}
    ]
  end
end
