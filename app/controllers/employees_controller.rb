class EmployeesController < ApplicationController

  def show
    @employee = Employee.find_by(id: params[:id], user_id: current_user.id)
  end

  def index
      @employees = Employee.where(user_id: current_user.id) 
  end

  def new
  end

  def create
    @employee = Employee.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    birth_date: params[:birth_date],
    user_id: current_user.id
    )
    render 'show'
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
