defmodule WorkAppDemo do

  alias WorkAppDemo.Management.Employee

  def create_employee(attrs) do
    case Employee.changeset(%Employee{}, attrs) do
      %{valid?: true} = changeset ->
        employee =
          changeset
          |> Ecto.Changeset.apply_changes()
          |> Map.put(:id, Ecto.UUID.generate())
        {:ok, employee}
      changeset ->
        {:error, changeset}
    end
  end
  @moduledoc """
  WorkAppDemo keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
end
