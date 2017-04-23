class TaskToDo < ApplicationRecord
  belongs_to :user
  belongs_to :day
  belongs_to :task
end
