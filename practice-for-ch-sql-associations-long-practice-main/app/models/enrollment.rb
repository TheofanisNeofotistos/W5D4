# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :bigint           not null
#  student_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
    belongs_to :student,
        primary_key: :id, 
        foreign_key: :student_id, 
        class_name: :User,
        dependent: :destroy 


    belongs_to :course,
        dependent: :destroy

end
