require 'pry'
class Student < ActiveRecord::Base
  attr_accessor :new_id, :unnamed_student_ids

  PAGE = "http://ruby006.students.flatironschool.com/"


  def self.select_student
    if Student.unnamed_students
      Student.unnamed_students.select(:id).shuffle.pop
    else
      @all_named = true
    end
    # @all_named = true
  end

  def self.unnamed_students
    Student.where(:named => false)
  end

  def self.named_students
    Student.where(:named => true)
  end

  def self.reset
    Student.update_all(:named => false)
  end

  def self.count_named
    Student.where(:named => true).count
  end

  def self.count_unnamed
    Student.where(:named => false).count
  end

  def first_name
    self.name.split[0]
  end

end

