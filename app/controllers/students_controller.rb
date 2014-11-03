require 'pry'
class StudentsController < ApplicationController

  def show
    if @all_named == true
      redirect_to '/all_named'
    end

    new_id = Student.select_student
    @student = Student.find_by(:id => new_id)
    @named = Student.count_named
    @unnamed = Student.count_unnamed
  end

  def answer
    @guess = params[:guess]
    @real_first_name = params[:real_first_name]
    @name = params[:real_full_name]
    if @guess == @real_first_name
      @value = true
      @student = Student.find_by(:name => @name)
      @student.named = true
      @student.save
    end
  end

  def done
    @students = Student.all
  end

  def reset
    Student.reset
    redirect_to '/'
  end

  def named
    @students = Student.named_students
  end

  def unnamed
    @students = Student.unnamed_students
  end


end