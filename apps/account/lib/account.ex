defmodule Account do
  @moduledoc """
  Documentation for Account.
  """

  alias Account.{Company, User}
  alias Sustenta.Repo

  import Ecto.Query, warn: false

  @type changeset_error :: {:error, Ecto.Changeset.t()}

  @doc """
  Returns the list of users.
  """
  @spec list_users() :: [User.t()]
  def list_users, do: Repo.all(User)

  @doc """
  Gets a single user.
  """
  @spec get_user(integer) :: User.t() | nil
  def get_user(id), do: Repo.get(User, id)


  def get_by(%{"email" => email}) do
    Repo.get_by(User, email: email)
  end

  def get_by(%{"user_id" => user_id}), do: Repo.get(User, user_id)

  @doc """
  Creates a user.
  """
  @spec create_user(map) :: {:ok, User.t()} | changeset_error
  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.
  """
  @spec update_user(User.t(), map) :: {:ok, User.t()} | changeset_error
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.
  """
  @spec delete_user(User.t()) :: {:ok, User.t()} | changeset_error
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.
  """
  @spec change_user(User.t()) :: Ecto.Changeset.t()
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  @doc """
  Returns the list of companies.
  """
  @spec list_companies() :: [Company.t()]
  def list_companies, do: Repo.all(Company)

  @doc """
  Gets a single company.
  """
  @spec get_company(integer) :: Company.t() | nil
  def get_company(id), do: Repo.get(Company, id)

  @doc """
  Creates a company.
  """
  @spec create_company(map) :: {:ok, Company.t()} | changeset_error
  def create_company(attrs) do
    %Company{}
    |> Company.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a company.
  """
  @spec update_company(Company.t(), map) :: {:ok, Company.t()} | changeset_error
  def update_company(%Company{} = company, attrs) do
    company
    |> Company.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Company.
  """
  @spec delete_company(Company.t()) :: {:ok, Company.t()} | changeset_error
  def delete_company(%Company{} = company) do
    Repo.delete(company)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking company changes.
  """
  @spec change_company(Company.t()) :: Ecto.Changeset.t()
  def change_company(%Company{} = company) do
    Company.changeset(company, %{})
  end
end
