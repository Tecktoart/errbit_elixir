defmodule ErrbitElixir.Err do
  use ErrbitElixir.Web, :model

  schema "errs" do
    field :last_notice_at, :naive_datetime
    field :resolved, :boolean, default: false
    field :resolved_at, :naive_datetime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:last_notice_at, :resolved, :resolved_at])
    |> validate_required([:last_notice_at, :resolved, :resolved_at])
  end
end
