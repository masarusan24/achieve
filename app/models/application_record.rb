class ApplicationRecord < ActiveRecord::Base
  MAX = 100
  scope :index, -> { limit(MAX) }
  self.abstract_class = true
end
