require 'pry'

holiday_hash =
  {
    :winter => {
      :christmas => ["Lights", "Wreath"],
      :new_years => ["Party Hats"]
    },
    :summer => {
      :fourth_of_july => ["Fireworks", "BBQ"]
    },
    :fall => {
      :thanksgiving => ["Turkey"]
    },
    :spring => {
      :memorial_day => ["BBQ"]
    }
  }

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  july_supply = ""
  # season = :winter, :summer, :fall, :spring
  holiday_hash.each { |season, holiday|
    # day = :christmas, :new_years, :fourth_of_july, etc
    holiday.each {|day, supplies|
      if day == :fourth_of_july
        july_supply = supplies[1]
      end
    }
  }
  july_supply
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each { |season, holiday|
    # day = :christmas, :new_years, :fourth_of_july, etc
    holiday.each {|day, supplies|
      if day == :christmas || day == :new_years
        supplies << supply
      end
    }
  }
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each { |season, holiday|
    # day = :christmas, :new_years, :fourth_of_july, etc
    holiday.each {|day, supplies|
      if day == :memorial_day
        supplies << supply
      end
    }
  }
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  supply_array = []
  # day = :christmas, :new_years, :fourth_of_july, etc
  holiday_hash[:winter].each {|day, supplies|
    supply_array << supplies
  }
  supply_array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each { |season, holiday|
    # day = :christmas, :new_years, :fourth_of_july, etc
    puts "#{season.to_s.capitalize}:"
    holiday.each {|day, supplies|
        day_string = day.to_s.split('_').collect { |word| word.capitalize }
        day_string = day_string.join(" ")

        puts "  #{day_string}: #{supplies.join(", ")}"
    }
  }
end

all_supplies_in_holidays(holiday_hash)

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_names = []
  holiday_hash.each { |season, holiday|
    # day = :christmas, :new_years, :fourth_of_july, etc
    holiday.each {|day, supplies|
      if supplies.include?("BBQ")
        holiday_names << day
      end
    }
  }
  holiday_names
end
