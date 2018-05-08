class Message
  include ActiveModel::Model
  attr_accessor :name, :company, :email, :project_description, :budget
  validates :name, :company, :email, :project_description, :budget, presence: true
end
