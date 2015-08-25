defmodule Battletracker.Character do
  use Battletracker.Web, :model

  schema "characters" do
    field :name, :string
    field :job, :string
    field :total_hp, :integer
    field :current_hp, :integer
    field :armor_class, :integer
    field :initiative, :integer
    field :alive, :boolean, default: false

    timestamps
  end

  @required_fields ~w(name job total_hp current_hp armor_class initiative alive)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
