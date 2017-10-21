defmodule ErrbitElixir.Repo.Migrations.CreateNotice do
  use Ecto.Migration

  def change do
    create table(:notices) do
      add :message, :string
      add :server_environment, :map
      add :request, :map
      add :notifier, :map
      add :user_attributes, :map
      add :framework, :string
      add :error_class, :string
      add :app_id, references(:apps, on_delete: :nothing)
      add :err_id, references(:errs, on_delete: :nothing)
      add :backtrace_id, references(:backtraces, on_delete: :nothing)

      timestamps()
    end

    create index(:notices, [:app_id])
    create index(:notices, [:err_id])
    create index(:notices, [:backtrace_id])
  end
end
