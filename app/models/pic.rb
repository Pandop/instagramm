class Pic < ApplicationRecord

  scope :sorted, lambda{order("created_at DESC")}
end
