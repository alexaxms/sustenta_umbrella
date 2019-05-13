defmodule SustentaWeb.CompanyController do
  use SustentaWeb, :controller

  alias Account
  alias Account.Company
  alias Sustenta.Repo

  plug :assign_user
  plug :authorize_user when action in [:new, :create, :update, :edit, :delete]

  def index(conn, _params) do
    companies = Repo.all(Ecto.assoc(conn.assigns[:user], :companies))
    render(conn, "index.html", companies: companies)
  end

  def new(conn, _params) do
    changeset =
      conn.assigns[:user]
      |> Ecto.build_assoc(:companies)
      |> Company.changeset(%{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"company" => company_params}) do
    changeset =
      conn.assigns[:user]
      |> Ecto.build_assoc(:companies)
      |> Company.changeset(company_params)
    case Repo.insert(changeset) do
      {:ok, _company} ->
        conn
        |> put_flash(:info, "Company created successfully.")
        |> redirect(to: Routes.user_company_path(conn, :index, conn.assigns[:user]))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    company = Repo.get!(Ecto.assoc(conn.assigns[:user], :companies), id)
    render(conn, "show.html", company: company)
  end
  def edit(conn, %{"id" => id}) do
    company = Repo.get!(Ecto.assoc(conn.assigns[:user], :companies), id)
    changeset = Company.changeset(company, %{})
    render(conn, "edit.html", company: company, changeset: changeset)
  end
  def update(conn, %{"id" => id, "company" => company_params}) do
    company = Repo.get!(Ecto.assoc(conn.assigns[:user], :companies), id)
    changeset = Company.changeset(company, company_params)
    case Repo.update(changeset) do
      {:ok, company} ->
        conn
        |> put_flash(:info, "Company updated successfully.")
        |> redirect(to: Routes.user_company_path(conn, :show, conn.assigns[:user], company))
      {:error, changeset} ->
        render(conn, "edit.html", company: company, changeset: changeset)
    end
  end
  def delete(conn, %{"id" => id}) do
    company = Repo.get!(Ecto.assoc(conn.assigns[:user], :companies), id)
    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(company)
    conn
    |> put_flash(:info, "Company deleted successfully.")
    |> redirect(to: Routes.user_company_path(conn, :index, conn.assigns[:user]))
  end

  defp assign_user(conn, _opts) do
    case conn.params do
      %{"user_id" => user_id} ->
        case Repo.get(Account.User, user_id) do
          nil  -> invalid_user(conn)
          user -> assign(conn, :user, user)
        end
      _ -> invalid_user(conn)
    end
  end

  defp invalid_user(conn) do
    conn
    |> put_flash(:error, "Invalid user!")
    |> redirect(to: Routes.page_path(conn, :index))
    |> halt
  end

  defp authorize_user(conn, _opts) do
    user = get_session(conn, :current_user)
    if user && Integer.to_string(user.id) == conn.params["user_id"] do
      conn
    else
      conn
      |> put_flash(:error, "You are not authorized to modify that Company!")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end
end
