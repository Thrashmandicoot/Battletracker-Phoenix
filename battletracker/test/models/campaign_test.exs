defmodule Battletracker.CampaignTest do
  use Battletracker.ModelCase

  alias Battletracker.Campaign

  @valid_attrs %{description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Campaign.changeset(%Campaign{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Campaign.changeset(%Campaign{}, @invalid_attrs)
    refute changeset.valid?
  end
end
