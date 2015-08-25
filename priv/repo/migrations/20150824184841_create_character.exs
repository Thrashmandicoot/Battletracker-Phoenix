defmodule Battletracker.Repo.Migrations.CreateCharacter do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string
      add :job, :string
      add :total_hp, :integer
      add :current_hp, :integer
      add :armor_class, :integer
      add :initiative, :integer
      add :alive, :boolean, default: false

      timestamps
    end

  end
end
