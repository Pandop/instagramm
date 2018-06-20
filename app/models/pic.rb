class Pic < ApplicationRecord

  belongs_to :user

  scope :sorted, lambda{order("created_at DESC")}
end
