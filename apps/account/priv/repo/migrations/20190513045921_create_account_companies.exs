defmodule Account.Repo.Migrations.CreateAccountCompanies do
  use Ecto.Migration

  def change do
    create table(:account_companies) do
      add :fantasy_name, :string
      add :business_name, :string
      add :rut, :string
      add :website, :string
      add :email, :string
      add :representative, :string
      add :phone, :string
      add :address, :string
      add :character, :string
      add :target, :string
      add :office_number, :string
      add :start_of_activities, :string
      add :activity_code, :string
      add :activity, :string
      add :size, :string
      add :offer, :string
      add :region, :string
      add :terms, :string

      timestamps()
    end

  end
end
