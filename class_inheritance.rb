class Employee

  attr_reader :name
  attr_accessor :title, :salary, :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
  end

  def boss=(boss)
    @boss=boss
    boss.add_employee(self) unless boss.nil?
    boss
  end


  def bonus(multiplier)
    bonus = (salary) * multiplier
  end

end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss)
    @employees = []
    super(name, title, salary, boss)
  end

  def add_employee(subordinate)
    employees << subordinate
    subordinate
  end

  def bonus(multiplier)
   sub_employee_salaries * multiplier
  end

  def sub_employee_salaries
    salaries = 0
    @employees.each do |person|
      salaries += person.salary
      if person.is_a?(Manager)
        salaries += person.sub_employee_salaries
      end
    end
    salaries
  end

end

ned = Manager.new("Ned", "founder", 1_000_000, nil)
darren = Manager.new("Darren", "TA Manager", 78_000, ned)
shawna = Employee.new("Shawna", "TA", 12_000, darren)
david = Employee.new("David", "TA", 10_000, darren)
