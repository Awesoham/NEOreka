# == Schema Information
#
# Table name: neos
#
#  id         :integer          not null, primary key
#  ra         :float
#  dec        :float
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  magnitude  :integer
#  notes      :text
#  score      :integer
#

class Neo < ActiveRecord::Base

  attr_accessible :name, :user_id, :ra, :dec, :created_at, :notes, :magnitude, :score, :user
  belongs_to :user
  acts_as_voteable

  validates :name,      presence: true, :uniqueness => true

  validates :magnitude, presence: true, :numericality => 
                         {:only_integer => true, :greater_than => -28, :less_than => 33}
  validates :score,     presence: true, :numericality => 
                         {:only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100}


  

end
