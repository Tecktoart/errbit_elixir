defmodule ErrbitElixir.Repo.Migrations.CreateBacktrace do
  use Ecto.Migration

  def change do
    create table(:backtraces) do
      add :lines, :map

      timestamps()
    end
  end
end
