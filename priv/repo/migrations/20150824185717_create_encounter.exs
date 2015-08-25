defmodule Battletracker.Repo.Migrations.CreateEncounter do
  use Ecto.Migration

  def change do
    create table(:encounters) do
      add :title, :string
      add :description, :text

      timestamps
    end

  end
end
