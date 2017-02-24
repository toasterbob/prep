class Student
  attr_reader :first_name, :last_name, :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{first_name} #{last_name}"
  end

  def enroll(course)
    raise "course conflicts" if conflicts_with?(course)
    unless @courses.include?(course)
      @courses << course
      course.students << self
    end
  end

  def course_load
    result = {}
    @courses.each do |course|
      if result[course.department]
        result[course.department] += course.credits
      else
        result[course.department] = course.credits
      end
    end
    result
  end

  def conflicts_with?(new_course)
    self.courses.any? do |enrolled_course|
      new_course.conflicts_with?(enrolled_course)
    end
  end


end
