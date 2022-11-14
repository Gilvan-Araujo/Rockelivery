defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 23,
      address: "Rua 1",
      cep: "12345678",
      cpf: "12312312312",
      email: "a@a.com",
      password: "123456",
      name: "Name"
    }
  end

  def user_factory do
    %User{
      age: 23,
      address: "Rua 1",
      cep: "12345678",
      cpf: "12312312312",
      email: "a@a.com",
      password: "123456",
      name: "Name",
      id: "6b3ba722-8622-4e83-85d2-026896fa97ad"
    }
  end
end
