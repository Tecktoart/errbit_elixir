defmodule ErrbitElixir.Backtrace do
  use ErrbitElixir.Web, :model

  schema "backtraces" do
    field :lines, :map

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:lines])
    |> validate_required([:lines])
  end
end
