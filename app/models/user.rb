class User < ApplicationRecord
  has_secure_password
  has_many :tasks
  has_many :task_to_dos
  
end
