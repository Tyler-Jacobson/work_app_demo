defmodule WorkAppDemoWeb.EmployeeView do
  use WorkAppDemoWeb, :view
  alias WorkAppDemoWeb.EmployeeView

  def render("index.json", %{employees: employees}) do
    %{data: render_many(employees, EmployeeView, "employee.json")}
  end

  def render("show.json", %{employee: employee}) do
    %{data: render_one(employee, EmployeeView, "employee.json")}
  end

  def render("employee.json", %{employee: employee}) do
    %{
      id: employee.id,
      first_name: employee.first_name,
      last_name: employee.last_name
    }
  end
end
