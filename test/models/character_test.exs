defmodule Battletracker.CharacterTest do
  use Battletracker.ModelCase

  alias Battletracker.Character

  @valid_attrs %{alive: true, armor_class: 42, current_hp: 42, initiative: 42, job: "some content", name: "some content", total_hp: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Character.changeset(%Character{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Character.changeset(%Character{}, @invalid_attrs)
    refute changeset.valid?
  end
end
