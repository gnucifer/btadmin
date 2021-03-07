defmodule BtadminWeb.MemberControllerTest do
  use BtadminWeb.ConnCase

  alias Btadmin.Members

  @create_attrs %{address: "some address", board_terms: "some board_terms", city: "some city", email: "some email", first_name: "some first_name", gdpr_hide_address: true, gdpr_hide_email: true, gdpr_hide_name: true, gdpr_hide_phone: true, gdpr_hide_photos: true, gdpr_option: "some gdpr_option", join_date: ~D[2010-04-17], last_name: "some last_name", member_role: "some member_role", notes: "some notes", phone: "some phone", postal_code: "some postal_code", print_options: "some print_options", seasons: "some seasons"}
  @update_attrs %{address: "some updated address", board_terms: "some updated board_terms", city: "some updated city", email: "some updated email", first_name: "some updated first_name", gdpr_hide_address: false, gdpr_hide_email: false, gdpr_hide_name: false, gdpr_hide_phone: false, gdpr_hide_photos: false, gdpr_option: "some updated gdpr_option", join_date: ~D[2011-05-18], last_name: "some updated last_name", member_role: "some updated member_role", notes: "some updated notes", phone: "some updated phone", postal_code: "some updated postal_code", print_options: "some updated print_options", seasons: "some updated seasons"}
  @invalid_attrs %{address: nil, board_terms: nil, city: nil, email: nil, first_name: nil, gdpr_hide_address: nil, gdpr_hide_email: nil, gdpr_hide_name: nil, gdpr_hide_phone: nil, gdpr_hide_photos: nil, gdpr_option: nil, join_date: nil, last_name: nil, member_role: nil, notes: nil, phone: nil, postal_code: nil, print_options: nil, seasons: nil}

  def fixture(:member) do
    {:ok, member} = Members.create_member(@create_attrs)
    member
  end

  describe "index" do
    test "lists all members", %{conn: conn} do
      conn = get(conn, Routes.member_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Members"
    end
  end

  describe "new member" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.member_path(conn, :new))
      assert html_response(conn, 200) =~ "New Member"
    end
  end

  describe "create member" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.member_path(conn, :create), member: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.member_path(conn, :show, id)

      conn = get(conn, Routes.member_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Member"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.member_path(conn, :create), member: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Member"
    end
  end

  describe "edit member" do
    setup [:create_member]

    test "renders form for editing chosen member", %{conn: conn, member: member} do
      conn = get(conn, Routes.member_path(conn, :edit, member))
      assert html_response(conn, 200) =~ "Edit Member"
    end
  end

  describe "update member" do
    setup [:create_member]

    test "redirects when data is valid", %{conn: conn, member: member} do
      conn = put(conn, Routes.member_path(conn, :update, member), member: @update_attrs)
      assert redirected_to(conn) == Routes.member_path(conn, :show, member)

      conn = get(conn, Routes.member_path(conn, :show, member))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, member: member} do
      conn = put(conn, Routes.member_path(conn, :update, member), member: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Member"
    end
  end

  describe "delete member" do
    setup [:create_member]

    test "deletes chosen member", %{conn: conn, member: member} do
      conn = delete(conn, Routes.member_path(conn, :delete, member))
      assert redirected_to(conn) == Routes.member_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.member_path(conn, :show, member))
      end
    end
  end

  defp create_member(_) do
    member = fixture(:member)
    %{member: member}
  end
end
