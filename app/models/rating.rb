class Rating < ActiveRecord::Base
 belongs_to :beer

def to_s
    puts "#{self.beer.name}  #{score}"
  end

end
