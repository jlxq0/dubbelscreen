class Datasource < ActiveRecord::Base
  belongs_to :datasourcetype

  validates :name, presence: true
end
