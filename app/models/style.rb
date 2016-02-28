class Style < ActiveRecord::Base
  has_many :beers, dependent: :destroy

 def self.top(n)
   sorted = Style.all.sort{ |s| s.average_rating }.reverse!.uniq.first(n)
 end
end
