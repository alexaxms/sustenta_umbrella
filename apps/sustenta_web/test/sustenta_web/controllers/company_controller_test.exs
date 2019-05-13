defmodule SustentaWeb.CompanyControllerTest do
  use SustentaWeb.ConnCase

  alias Account

  @create_attrs %{activity: "some activity", activity_code: "some activity_code", address: "some address", business_name: "some business_name", character: "some character", email: "some email", offer: "some offer", office_number: "some office_number", phone: "some phone", region: "some region", representative: "some representative", rut: "some rut", size: "some size", start_of_activities: "some start_of_activities", target: "some target", terms: "some terms", website: "some website"}
  @update_attrs %{activity: "some updated activity", activity_code: "some updated activity_code", address: "some updated address", business_name: "some updated business_name", character: "some updated character", email: "some updated email", offer: "some updated offer", office_number: "some updated office_number", phone: "some updated phone", region: "some updated region", representative: "some updated representative", rut: "some updated rut", size: "some updated size", start_of_activities: "some updated start_of_activities", target: "some updated target", terms: "some updated terms", website: "some updated website"}
  @invalid_attrs %{activity: nil, activity_code: nil, address: nil, business_name: nil, character: nil, email: nil, offer: nil, office_number: nil, phone: nil, region: nil, representative: nil, rut: nil, size: nil, start_of_activities: nil, target: nil, terms: nil, website: nil}

  def fixture(:company) do
    {:ok, company} = Account.create_company(@create_attrs)
    company
  end

  describe "index" do
    test "lists all companies", %{conn: conn} do
      conn = get(conn, Routes.company_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Companies"
    end
  end

  describe "new company" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.company_path(conn, :new))
      assert html_response(conn, 200) =~ "New Company"
    end
  end

  describe "create company" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.company_path(conn, :create), company: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.company_path(conn, :show, id)

      conn = get(conn, Routes.company_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Company"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.company_path(conn, :create), company: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Company"
    end
  end

  describe "edit company" do
    setup [:create_company]

    test "renders form for editing chosen company", %{conn: conn, company: company} do
      conn = get(conn, Routes.company_path(conn, :edit, company))
      assert html_response(conn, 200) =~ "Edit Company"
    end
  end

  describe "update company" do
    setup [:create_company]

    test "redirects when data is valid", %{conn: conn, company: company} do
      conn = put(conn, Routes.company_path(conn, :update, company), company: @update_attrs)
      assert redirected_to(conn) == Routes.company_path(conn, :show, company)

      conn = get(conn, Routes.company_path(conn, :show, company))
      assert html_response(conn, 200) =~ "some updated activity"
    end

    test "renders errors when data is invalid", %{conn: conn, company: company} do
      conn = put(conn, Routes.company_path(conn, :update, company), company: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Company"
    end
  end

  describe "delete company" do
    setup [:create_company]

    test "deletes chosen company", %{conn: conn, company: company} do
      conn = delete(conn, Routes.company_path(conn, :delete, company))
      assert redirected_to(conn) == Routes.company_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.company_path(conn, :show, company))
      end
    end
  end

  defp create_company(_) do
    company = fixture(:company)
    {:ok, company: company}
  end
end
