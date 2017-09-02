defmodule ErrbitElixir.Repo.Migrations.CreateApp do
  use Ecto.Migration

  def change do
    create table(:apps) do
      add :name, :string
      add :api_key, :string
      add :github_repo, :string
      add :bitbucket_repo, :string
      add :asset_host, :string
      add :repository_branch, :string
      add :current_app_version, :string
      add :notify_all_users, :boolean, default: false, null: false
      add :notify_on_errs, :boolean, default: true, null: false
      add :email_at_notices, :string

      timestamps()
    end
  end
end
