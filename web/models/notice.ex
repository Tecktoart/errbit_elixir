defmodule ErrbitElixir.Notice do
  use ErrbitElixir.Web, :model

  schema "notices" do
    field :message, :string
    field :server_environment, :map
    field :request, :map
    field :notifier, :map
    field :user_attributes, :map
    field :framework, :string
    field :error_class, :string
    belongs_to :app, ErrbitElixir.App, foreign_key: :app_id
    belongs_to :err, ErrbitElixir.Err, foreign_key: :err_id
    belongs_to :backtrace, ErrbitElixir.Backtrace, foreign_key: :backtrace_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:message, :server_environment, :request, :notifier, :user_attributes, :framework, :error_class])
    |> validate_required([:message, :server_environment, :request, :notifier, :user_attributes, :framework, :error_class])
  end
end
