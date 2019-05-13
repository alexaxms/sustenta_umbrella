defmodule Account.Repo.Migrations.CreateAccountUsers do
  use Ecto.Migration

  def change do
    create table(:account_users) do
      add :username, :string
      add :email, :string
      add :password_digest, :string

      timestamps()
    end

  end
end
