defmodule Btadmin.MembersTest do
  use Btadmin.DataCase

  alias Btadmin.Members

  describe "members" do
    alias Btadmin.Members.Member

    @valid_attrs %{address: "some address", board_terms: "some board_terms", city: "some city", email: "some email", first_name: "some first_name", gdpr_hide_address: true, gdpr_hide_email: true, gdpr_hide_name: true, gdpr_hide_phone: true, gdpr_hide_photos: true, gdpr_option: "some gdpr_option", join_date: ~D[2010-04-17], last_name: "some last_name", member_role: "some member_role", notes: "some notes", phone: "some phone", postal_code: "some postal_code", print_options: "some print_options", seasons: "some seasons"}
    @update_attrs %{address: "some updated address", board_terms: "some updated board_terms", city: "some updated city", email: "some updated email", first_name: "some updated first_name", gdpr_hide_address: false, gdpr_hide_email: false, gdpr_hide_name: false, gdpr_hide_phone: false, gdpr_hide_photos: false, gdpr_option: "some updated gdpr_option", join_date: ~D[2011-05-18], last_name: "some updated last_name", member_role: "some updated member_role", notes: "some updated notes", phone: "some updated phone", postal_code: "some updated postal_code", print_options: "some updated print_options", seasons: "some updated seasons"}
    @invalid_attrs %{address: nil, board_terms: nil, city: nil, email: nil, first_name: nil, gdpr_hide_address: nil, gdpr_hide_email: nil, gdpr_hide_name: nil, gdpr_hide_phone: nil, gdpr_hide_photos: nil, gdpr_option: nil, join_date: nil, last_name: nil, member_role: nil, notes: nil, phone: nil, postal_code: nil, print_options: nil, seasons: nil}

    def member_fixture(attrs \\ %{}) do
      {:ok, member} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Members.create_member()

      member
    end

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Members.list_members() == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Members.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      assert {:ok, %Member{} = member} = Members.create_member(@valid_attrs)
      assert member.address == "some address"
      assert member.board_terms == "some board_terms"
      assert member.city == "some city"
      assert member.email == "some email"
      assert member.first_name == "some first_name"
      assert member.gdpr_hide_address == true
      assert member.gdpr_hide_email == true
      assert member.gdpr_hide_name == true
      assert member.gdpr_hide_phone == true
      assert member.gdpr_hide_photos == true
      assert member.gdpr_option == "some gdpr_option"
      assert member.join_date == ~D[2010-04-17]
      assert member.last_name == "some last_name"
      assert member.member_role == "some member_role"
      assert member.notes == "some notes"
      assert member.phone == "some phone"
      assert member.postal_code == "some postal_code"
      assert member.print_options == "some print_options"
      assert member.seasons == "some seasons"
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Members.create_member(@invalid_attrs)
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      assert {:ok, %Member{} = member} = Members.update_member(member, @update_attrs)
      assert member.address == "some updated address"
      assert member.board_terms == "some updated board_terms"
      assert member.city == "some updated city"
      assert member.email == "some updated email"
      assert member.first_name == "some updated first_name"
      assert member.gdpr_hide_address == false
      assert member.gdpr_hide_email == false
      assert member.gdpr_hide_name == false
      assert member.gdpr_hide_phone == false
      assert member.gdpr_hide_photos == false
      assert member.gdpr_option == "some updated gdpr_option"
      assert member.join_date == ~D[2011-05-18]
      assert member.last_name == "some updated last_name"
      assert member.member_role == "some updated member_role"
      assert member.notes == "some updated notes"
      assert member.phone == "some updated phone"
      assert member.postal_code == "some updated postal_code"
      assert member.print_options == "some updated print_options"
      assert member.seasons == "some updated seasons"
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Members.update_member(member, @invalid_attrs)
      assert member == Members.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Members.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Members.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Members.change_member(member)
    end
  end
end
