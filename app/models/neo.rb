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

  attr_accessible :name, :user_id, :ra, :dec, :created_at, :notes, :magnitude, :score, :user, :observations, :observations_attributes
  belongs_to :user

  has_many :observations
  accepts_nested_attributes_for :observations

  acts_as_voteable

  #validates :name,      presence: true#, :uniqueness => true

  #validates :magnitude, presence: true, :numericality => 
                         #{:only_integer => true, :greater_than => -28, :less_than => 33}
  #validates :score,     presence: true, :numericality =>
                         #{:only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100}
  def votes_of
    vl = []
    self.votes.each do |v|
      vl << {voter: v.voter, type: "#{v.vote ? "up" : "down"}", time: v.created_at}
    end
    vl.count > 5 ? vl[-5..-1].reverse : vl.reverse
  end                       

  

end
