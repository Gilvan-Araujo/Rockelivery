defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  alias Ecto.Changeset
  alias Rockelivery.User

  import Rockelivery.Factory

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Name"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the updated values" do
      params = build(:user_params)

      update_params = %{name: "New Name", password: "123456"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "New Name"}, valid?: true} = response
    end

    test "when there is some error, returns an invalid changeset" do
      params = build(:user_params, %{age: 15, password: "123"})

      response = User.changeset(params)

      expected_response = %{
        age: [
          "must be greater than or equal to 18"
        ],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
