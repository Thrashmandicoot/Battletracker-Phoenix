defmodule Battletracker.EncounterControllerTest do
  use Battletracker.ConnCase

  alias Battletracker.Encounter
  @valid_attrs %{description: "some content", title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, encounter_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing encounters"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, encounter_path(conn, :new)
    assert html_response(conn, 200) =~ "New encounter"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, encounter_path(conn, :create), encounter: @valid_attrs
    assert redirected_to(conn) == encounter_path(conn, :index)
    assert Repo.get_by(Encounter, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, encounter_path(conn, :create), encounter: @invalid_attrs
    assert html_response(conn, 200) =~ "New encounter"
  end

  test "shows chosen resource", %{conn: conn} do
    encounter = Repo.insert! %Encounter{}
    conn = get conn, encounter_path(conn, :show, encounter)
    assert html_response(conn, 200) =~ "Show encounter"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, encounter_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    encounter = Repo.insert! %Encounter{}
    conn = get conn, encounter_path(conn, :edit, encounter)
    assert html_response(conn, 200) =~ "Edit encounter"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    encounter = Repo.insert! %Encounter{}
    conn = put conn, encounter_path(conn, :update, encounter), encounter: @valid_attrs
    assert redirected_to(conn) == encounter_path(conn, :show, encounter)
    assert Repo.get_by(Encounter, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    encounter = Repo.insert! %Encounter{}
    conn = put conn, encounter_path(conn, :update, encounter), encounter: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit encounter"
  end

  test "deletes chosen resource", %{conn: conn} do
    encounter = Repo.insert! %Encounter{}
    conn = delete conn, encounter_path(conn, :delete, encounter)
    assert redirected_to(conn) == encounter_path(conn, :index)
    refute Repo.get(Encounter, encounter.id)
  end
end
