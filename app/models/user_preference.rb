class UserPreference < ApplicationRecord
  belongs_to :user
  validates :default_start_time, presence: true
  validates :default_end_time, presence: true
  validates :speed, presence: true
  validates :time_between, presence: true
  
end
