defmodule Account.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "account_companies" do
    belongs_to :user, Account.User
    field :activity, :string
    field :activity_code, :string
    field :address, :string
    field :business_name, :string
    field :character, :string
    field :email, :string
    field :fantasy_name, :string
    field :offer, :string
    field :office_number, :string
    field :phone, :string
    field :region, :string
    field :representative, :string
    field :rut, :string
    field :size, :string
    field :start_of_activities, :string
    field :target, :string
    field :terms, :string
    field :website, :string

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:fantasy_name, :business_name, :rut, :website, :email, :representative, :phone, :address, :character, :target, :office_number, :start_of_activities, :activity_code, :activity, :size, :offer, :region, :terms])
    |> validate_required([:fantasy_name, :business_name, :rut, :website, :email, :representative, :phone, :address, :character, :target, :office_number, :start_of_activities, :activity_code, :activity, :size, :offer, :region, :terms])
  end
end
