class Datasourcetype < ActiveRecord::Base
  has_many :datasources

  validates :name, presence: true
end
