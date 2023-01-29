class Student < ApplicationRecord
	MATH = "math" #global variable
	SCIENCE = "science" #global variable

	scope :science_students, -> { where(subject: SCIENCE) }
	scope :math_students, -> { where(subject: MATH) }
end

#lambda. #scope