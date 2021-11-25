defmodule WorkAppDemoWeb.EmployeeController do
  use WorkAppDemoWeb, :controller

  alias WorkAppDemo.Management
  alias WorkAppDemo.Management.Employee

  action_fallback WorkAppDemoWeb.FallbackController

  def index(conn, _params) do
    employees = Management.list_employees()
    render(conn, "index.json", employees: employees)
  end

  def create(conn, %{"employee" => employee_params}) do
    with {:ok, %Employee{} = employee} <- Management.create_employee(employee_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.employee_path(conn, :show, employee))
      |> render("show.json", employee: employee)
    end
  end

  def show(conn, %{"id" => id}) do
    employee = Management.get_employee!(id)
    render(conn, "show.json", employee: employee)
  end

  def update(conn, %{"id" => id, "employee" => employee_params}) do
    employee = Management.get_employee!(id)

    with {:ok, %Employee{} = employee} <- Management.update_employee(employee, employee_params) do
      render(conn, "show.json", employee: employee)
    end
  end

  def delete(conn, %{"id" => id}) do
    employee = Management.get_employee!(id)

    with {:ok, %Employee{}} <- Management.delete_employee(employee) do
      send_resp(conn, :no_content, "")
    end
  end
end
