defmodule Battletracker.EncounterController do
  use Battletracker.Web, :controller

  alias Battletracker.Encounter

  plug :scrub_params, "encounter" when action in [:create, :update]

  def index(conn, _params) do
    encounters = Repo.all(Encounter)
    render(conn, "index.html", encounters: encounters)
  end

  def new(conn, _params) do
    changeset = Encounter.changeset(%Encounter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"encounter" => encounter_params}) do
    changeset = Encounter.changeset(%Encounter{}, encounter_params)

    case Repo.insert(changeset) do
      {:ok, _encounter} ->
        conn
        |> put_flash(:info, "Encounter created successfully.")
        |> redirect(to: encounter_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    encounter = Repo.get!(Encounter, id)
    render(conn, "show.html", encounter: encounter)
  end

  def edit(conn, %{"id" => id}) do
    encounter = Repo.get!(Encounter, id)
    changeset = Encounter.changeset(encounter)
    render(conn, "edit.html", encounter: encounter, changeset: changeset)
  end

  def update(conn, %{"id" => id, "encounter" => encounter_params}) do
    encounter = Repo.get!(Encounter, id)
    changeset = Encounter.changeset(encounter, encounter_params)

    case Repo.update(changeset) do
      {:ok, encounter} ->
        conn
        |> put_flash(:info, "Encounter updated successfully.")
        |> redirect(to: encounter_path(conn, :show, encounter))
      {:error, changeset} ->
        render(conn, "edit.html", encounter: encounter, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    encounter = Repo.get!(Encounter, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(encounter)

    conn
    |> put_flash(:info, "Encounter deleted successfully.")
    |> redirect(to: encounter_path(conn, :index))
  end
end
