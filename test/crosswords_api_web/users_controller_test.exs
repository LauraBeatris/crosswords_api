defmodule CrosswordsApiWeb.UsersControllerTest do
  use CrosswordsApiWeb.ConnCase

  alias CrosswordsApi.Users
  alias Users.User
  import CrosswordsApi.Factory

  describe "create/2" do
    test "successfully creates an user", %{conn: conn} do
      response =
        conn
        |> post(~p"/api/users", %{
          name: "Foo Bar",
          email: "foo@bar.com",
          password: "foobar"
        })
        |> json_response(:created)

      assert %{
               "data" => %{
                 "email" => "foo@bar.com",
                 "id" => _id,
                 "inserted_at" => _inserted_at,
                 "name" => "Foo Bar",
                 "updated_at" => _updated_at
               },
               "message" => "User created successfully."
             } = response
    end

    test "with invalid params, returns error", %{conn: conn} do
      response =
        conn
        |> post(~p"/api/users", %{
          name: nil
        })
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{
          "email" => ["can't be blank"],
          "name" => ["can't be blank"],
          "password" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/1" do
    test "successfully deletes a user", %{conn: conn} do
      %User{id: id, name: name, email: email, inserted_at: inserted_at, updated_at: updated_at} =
        insert(:user)

      response =
        conn
        |> delete(~p"/api/users/#{id}")
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "email" => email,
          "id" => id,
          "inserted_at" => NaiveDateTime.to_iso8601(inserted_at),
          "name" => name,
          "updated_at" => NaiveDateTime.to_iso8601(updated_at)
        },
        "message" => "User deleted successfully."
      }

      assert response == expected_response
    end

    test "with an user that doesn't exist, returns error", %{conn: conn} do
      response =
        conn
        |> delete(~p"/api/users/1")
        |> json_response(:not_found)

      expected_response = %{
        "message" => "Entity not found",
        "status" => "not_found"
      }

      assert response == expected_response
    end
  end

  describe "update/2" do
    test "successfully updates a user", %{conn: conn} do
      %User{id: id, email: email, inserted_at: inserted_at, updated_at: updated_at} =
        insert(:user)

      response =
        conn
        |> put(~p"/api/users/#{id}", %{
          name: "Foo Bar Updated"
        })
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "email" => email,
          "id" => id,
          "inserted_at" => NaiveDateTime.to_iso8601(inserted_at),
          "name" => "Foo Bar Updated",
          "updated_at" => NaiveDateTime.to_iso8601(updated_at)
        },
        "message" => "User updated successfully."
      }

      assert response == expected_response
    end

    test "with an user that doesn't exist, returns error", %{conn: conn} do
      response =
        conn
        |> put(~p"/api/users/1")
        |> json_response(:not_found)

      expected_response = %{
        "message" => "Entity not found",
        "status" => "not_found"
      }

      assert response == expected_response
    end

    test "with invalid params, returns error", %{conn: conn} do
      %User{id: id} =
        insert(:user)

      response =
        conn
        |> put(~p"/api/users/#{id}", %{
          name: nil
        })
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{
          "name" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end
end
