require "employee"
    

class Startup
    # attr_writer :employees, :funding

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees 
    end

    def valid_title?(title)
        if @salaries.has_key?(title)
            return true
        else
            return false
        end
    end

    def >(second)
        self.funding > second.funding
    end

    def hire(employee_name, title)
        if !salaries.has_key?(title)
            raise "not an official title"
        else
            @employees << Employee.new(employee_name, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @salaries[employee.title] < @funding
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise "not enough money :("
        end
    end

    def payday
        @employees.each do |person|
            self.pay_employee(person)
        end
    end

    def average_salary
        total = @employees.map do |person|
            salaries[person.title]
        end
        total.sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(second)
        @funding += second.funding
        
        second.salaries.each do |title, pay|
            if !@salaries.has_key?(title)
                @salaries[title] = pay
            end
        end
        @employees += second.employees
        second.close
    end

end
