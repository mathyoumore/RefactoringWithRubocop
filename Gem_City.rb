# Class represents Gem_City
class GemCity
  # This class represents the town of GemCity
  # This is a town riddled with crime but we can find out how happy the town is

  attr_reader :population, :thieves, :officers

  def initialize
    @population = 50
    @people = {
      thieves: 5,
      officers: 1 }
    @demographics = city_demographics
  end

  def thieves
    @people[:thieves]
  end

  def thieves=(value)
    @people[:thieves] = value
  end

  def officers=(value)
    @people[:officers] = value
  end

  def officers
    @people[:officers]
  end

  def civilians
    @population - officers - thieves
  end

  def happiness_of_town
    # Happiness is random... people don't know what they want!
    happiness_vals = []
    happiness = 0
    (1..@population).each do
      happiness_vals.push(rand((100 - successful_crime_rate)..100))
    end
    happiness_vals.each do |value|
      happiness += value
    end
    happiness / 100
  end

  def successful_crime_rate
    thieves = @people[:thieves]
    officers = @people[:officers]
    if thieves <= 0 || officers > thieves
      odds_percent = 0
    else
      odds = 1 - (officers.to_f / thieves.to_f)
      odds_percent = odds * 100
    end
    odds_percent
  end

  def city_demographics
    @demographics = {
      thieves: calculate_demographic(thieves),
      officers: calculate_demographic(officers),
      civilians: calculate_demographic(civilians)
    }
  end

  def calculate_demographic(value)
    ((value / population.to_f) * 100).round(0).to_s + '%'
  end
end
