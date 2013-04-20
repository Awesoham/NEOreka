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
  before_save :strip_decimals_of_coords
  attr_accessible :name, :user_id, :ra, :dec, :created_at, :notes, :magnitude, :score
  belongs_to :user
  acts_as_voteable

  validates :name,      presence: true, :uniqueness => true
  validates :ra,        presence: true, :numericality => 
                         {:greater_than_or_equal_to => 0,         :less_than_or_equal_to => 86400.0}
  validates :dec,       presence: true, :numericality => 
                         {:greater_than_or_equal_to => -324000.0, :less_than_or_equal_to => 324000.0}
  validates :magnitude, presence: true, :numericality => 
                         {:only_integer => true, :greater_than => -28, :less_than => 33}
  validates :score,     presence: true, :numericality => 
                         {:only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100}


  def _dec
    hms(self.dec)
  end

  def _ra
  	hms(self.ra)
  end

  def dec_str
    d = _dec
    "#{d[:hr]}&deg; #{d[:min]}&prime; #{d[:sec]}&Prime;"
  end
  
  def ra_str
    r = _ra
    "#{r[:hr]}#{sup('h')} #{r[:min]}#{sup('m')} #{r[:sec]}#{sup('s')}"
  end  

  def rev_hms(h)
      h[:hr]*3600 + h[:min]*60 + h[:sec]
  end

  private
    def sup(str)
      "<sup>#{str}</sup>"
    end  

    def hms(n)
      frac_sec = n - n.to_i
      n -= frac_sec
      min = n.modulo(3600)
      hr = (n - min)/3600
      sec = min.modulo(60)
      min = (min - sec)/60
      sec += frac_sec
      sec = ((sec*100).to_i)/100.0
      n = {hr: hr.to_i, min: min.to_i, sec: sec}
    end 

    def strip_decimals(n)
        ((n*100).to_i)/100.0
    end

    def strip_decimals_of_coords
        self.ra = strip_decimals(self.ra)
        self.dec = strip_decimals(self.dec)
    end  

end
