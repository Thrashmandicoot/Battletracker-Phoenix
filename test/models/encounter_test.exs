defmodule Battletracker.EncounterTest do
  use Battletracker.ModelCase

  alias Battletracker.Encounter

  @valid_attrs %{description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Encounter.changeset(%Encounter{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Encounter.changeset(%Encounter{}, @invalid_attrs)
    refute changeset.valid?
  end
end
