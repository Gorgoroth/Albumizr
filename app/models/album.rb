class Album < ActiveRecord::Base
  attr_accessible :user_id, :user, :title, :artist, :year

  validates_presence_of :user
  validates_presence_of :title
  validates_presence_of :artist
  validates_presence_of :year
  validates_numericality_of :year, :greater_than => 1889

  belongs_to :user

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end