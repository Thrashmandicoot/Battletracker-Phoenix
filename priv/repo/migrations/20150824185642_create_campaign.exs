defmodule Battletracker.Repo.Migrations.CreateCampaign do
  use Ecto.Migration

  def change do
    create table(:campaigns) do
      add :title, :string
      add :description, :text

      timestamps
    end

  end
end
