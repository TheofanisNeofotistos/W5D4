# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  prereq_id     :bigint
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord

    belongs_to :prereq,
        primary_key: :id,
        foreign_key: :prereq_id,
        class_name: :Course,
        optional: true

    belongs_to :instructor,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :User

    has_many :enrollments,
        dependent: :destroy

    has_many :enrolled_students, 
        through: :enrollments,
        source: :student

end
