defmodule Account.Repo.Migrations.AddUserIdToPosts do
  use Ecto.Migration

  def change do
    alter table(:account_companies) do
      add :user_id, references(:account_users)
    end
    create index(:account_companies, [:user_id])
  end
end
