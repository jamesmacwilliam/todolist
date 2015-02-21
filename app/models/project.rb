class Project < ActiveRecord::Base

  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates_presence_of :title

  def new
  end

  def create
  end

  def destroy
  end
end
