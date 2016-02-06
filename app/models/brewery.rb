class Brewery < ActiveRecord::Base
 include RatingAverage

 validates :name, presence: :true
 validate :year_maximum_and_minimum

 has_many :beers, dependent: :destroy
 has_many :ratings, through: :beers

  def year_maximum_and_minimum
    min = 1041
    max = Time.now.year + 1
    if year < min or year > max
      errors.add(:year, "Year cannot be less than 1042 or greater than current year")
    end
  end

  def to_s
    "#{name}"
  end

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

  def restart
    self.year = 2016
    puts "changed year to #{year}"
  end


end
