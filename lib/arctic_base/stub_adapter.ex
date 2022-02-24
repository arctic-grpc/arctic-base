defmodule Arctic.Base.StubAdapter do
  defstruct [:conn_pid, :module]

  @type t :: %__MODULE__{
          conn_pid: pid,
          module: module
        }
  @type service_name :: String.t()
  @type message :: struct

  @callback connect(Arctic.Base.Channel.t()) :: :ok
  @callback request(
              Arctic.Base.Channel.t(),
              Arctic.Base.UnaryRequest.t() | Arctic.Base.StreamRequest.t()
            ) :: :ok

  @doc false
  def new(args) do
    struct(%__MODULE__{}, args)
  end

  @doc false
  def validate_input(%__MODULE__{}) do
    :ok
  end

  @doc false
  def validate_input(other) do
    raise ArgumentError, "expecting %Arctic.Base.StubAdapter{} but got #{inspect(other)}"
  end
end
