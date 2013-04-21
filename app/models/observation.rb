class Observation < ActiveRecord::Base
    before_save :strip_decimals_of_coords
    attr_accessible :dec, :ra, :neo, :user, :ra_s, :ra_m, :ra_h, :dec_s, :dec_m, :dec_h
    attr_accessor :ra_s, :ra_m, :ra_h, :dec_s, :dec_m, :dec_h
    belongs_to :user
    belongs_to :neo

    validates :ra,        presence: true, :numericality => 
                           {:greater_than_or_equal_to => 0,         :less_than_or_equal_to => 86400.0}
    validates :dec,       presence: true, :numericality => 
                           {:greater_than_or_equal_to => -324000.0, :less_than_or_equal_to => 324000.0}
    #validates :neo,       presence: true
    #validates :user,      presence: true
    
    acts_as_voteable  
                         
    def _dec;     hms(self.dec);    end
    def _ra;      hms(self.ra);     end

    def ra_h;     _ra[:hr].to_s + sup('h');         end
    def ra_m;     _ra[:min].to_s + sup('m');        end
    def ra_s;     _ra[:sec].to_s + sup('s');        end

    def dec_d;    _dec[:hr].to_s + '&deg;';       end
    def dec_m;    _dec[:min].to_s + '&prime;';       end
    def dec_s;    _dec[:sec].to_s + '&Prime;';       end

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
