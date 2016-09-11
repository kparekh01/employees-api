class Api::V1::EmployeesController < ApplicationController

  def show
    @employee = Employee.find_by(id: params[:id])
  end

  def index
      @employee = Employee.all
  end

  def create
    employee = Employee.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    birth_date: params[:birth_date]
    )
    if employee.save
      render json: {message: "Employee was added successfully!"}
    else
      render json: {errors: employee.errors.full_messages}, status: 422
    end
  end

  def update
    @employee = Employee.find_by(id: params[:id])
    @employee.update(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    birth_date: params[:birth_date]
    )
    render 'show'
  end

  def destroy
    @employee = Employee.find_by(id: params[:id])
    @employee.destroy
    @employee = Employee.all
    render 'index'
  end
end
