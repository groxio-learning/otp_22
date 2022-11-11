defmodule Enigma.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Enigma.Worker.start_link(arg)
      {DynamicSupervisor, name: Dsup}
      # {Enigma.Server, :antman},
      # {Enigma.Server, :gandalf},
      # {Enigma.Server, :groot},
      # {Enigma.Server, :snape},
      # {Enigma.Server, :superman},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: Sup]
    Supervisor.start_link(children, opts)
  end
end
