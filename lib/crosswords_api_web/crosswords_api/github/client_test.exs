defmodule CrosswordsApi.GitHub.ClientTest do
  use ExUnit.Case, async: true

  alias CrosswordsApi.GitHub.Client

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  defp endpoint_url(port), do: "http://localhost:#{port}"

  describe "call/1" do
    test "returns a user", %{bypass: bypass} do
      name = "laurabeatris"

      expected_response = "test"

      body = ~s({
        "login": "LauraBeatris",
        "id": "48022589"
      })

      Bypass.expect(bypass, "GET", "/users/laurabeatris", fn conn ->
        conn
        |> Plug.Conn.put_resp_content_type("application/json")
        |> Plug.Conn.resp(200, body)
      end)

      response =
        bypass.port
        |> endpoint_url
        |> Client.call(name)

      expected_response =
        {:ok,
         %{
           "login" => "LauraBeatris",
           "id" => "48022589"
         }}

      assert response == expected_response
    end
  end
end
