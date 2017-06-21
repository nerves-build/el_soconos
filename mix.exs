defmodule ElSoconos.Mixfile do
  use Mix.Project

  def project do
    [app: :el_soconos,
     version: "1.0.0",
     elixir: "~> 1.4",
     name: "el_soconos",
     docs: [extras: ["README.md"]],
     description: description(),
     package: package(),
     source_url: "https://github.com/nerves-build/el_soconos",
     compilers: Mix.compilers,
     make_clean: ["clean"],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [
      mod: { ElSoconos, [] },
      applications: [:logger]
    ]
  end

  defp description do
  """
  Elixir access to the Python Soco library for controlling a Sonos music system
  """
  end

  defp package do
    %{files: ["lib/*", "priv/*", "mix.exs", "README.md"],
      maintainers: ["Steven Fuchs"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/nerves-build/el_soconos"}}
  end

  defp deps do
    [
      {:export, "~> 0.1.0"},
      {:erlport, "~> 0.9"},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
    ]
  end
end
