class User < ApplicationRecord
  has_many :enrollments, dependent: :destroy #will delete user and courses for that user
  has_many :courses, through: :enrollments

  def full_name
    "#{self.first_name} #{self.last_name}" #instance method so needs
    #class self in front of var
  end

end
