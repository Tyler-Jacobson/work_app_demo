defmodule WorkAppDemo.ManagementFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WorkAppDemo.Management` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> WorkAppDemo.Management.create_employee()

    employee
  end
end
