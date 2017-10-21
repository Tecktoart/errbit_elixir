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
    |> validate_required([:name, :github_repo, :bitbucket_repo, :asset_host, :repository_branch, :current_app_version, :notify_all_users, :notify_on_errs])
    |> generate_api_key
  end

  def generate_api_key(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        put_change(changeset, :api_key, SecureRandom.urlsafe_base64())
      _ ->
        changeset
    end
  end
end
