class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  has_many :task_to_dos
end
