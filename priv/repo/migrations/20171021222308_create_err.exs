defmodule ErrbitElixir.Repo.Migrations.CreateErr do
  use Ecto.Migration

  def change do
    create table(:errs) do
      add :last_notice_at, :naive_datetime
      add :resolved, :boolean, default: false, null: false
      add :resolved_at, :naive_datetime

      timestamps()
    end
  end
end
