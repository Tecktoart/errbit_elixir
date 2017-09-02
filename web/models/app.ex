defmodule ErrbitElixir.App do
  use ErrbitElixir.Web, :model

  schema "apps" do
    field :name, :string
    field :api_key, :string
    field :github_repo, :string
    field :bitbucket_repo, :string
    field :asset_host, :string
    field :repository_branch, :string
    field :current_app_version, :string
    field :notify_all_users, :boolean, default: false
    field :notify_on_errs, :boolean, default: false
    field :email_at_notices, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :api_key, :github_repo, :bitbucket_repo, :asset_host, :repository_branch, :current_app_version, :notify_all_users, :notify_on_errs, :email_at_notices])
    |> validate_required([:name, :api_key, :github_repo, :bitbucket_repo, :asset_host, :repository_branch, :current_app_version, :notify_all_users, :notify_on_errs, :email_at_notices])
  end
end
