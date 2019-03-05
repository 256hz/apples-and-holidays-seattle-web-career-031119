require 'pry'

holiday_hash = {
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
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each do |k, v|
    holiday_hash[:winter][k].push(supply)
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] = supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  #puts "all_winter_holiday_supplies"
  winter_supplies = []
  holiday_hash[:winter].each do |k, v|
    #puts "#{k}, #{v}"
    v.each {|value| winter_supplies << value}
  end
  #puts winter_supplies
  winter_supplies
end

#all_winter_holiday_supplies(holiday_hash)

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, value|
    puts "#{season.to_s.capitalize}:"
    holiday_hash[season].each do |holiday, supplies_array|
      if holiday.to_s.include?("_")
        holiday_array = holiday.to_s.split("_")
        holiday_array2 = []
        holiday_array.each do |word|
          holiday_array2.push(word.capitalize)
        end
        holiday_string = holiday_array2.join(" ")
      else
        holiday_string = holiday.to_s.capitalize
      end
      supplies_string = "  #{holiday_string}: "
      supplies_string += supplies_array.join(", ")
      puts supplies_string
    end
  end
end

#all_supplies_in_holidays(holiday_hash)

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_array = []
  #puts holiday_hash
  holiday_hash.each do |season, values|
    holiday_hash[season].each do |holiday, values|
      bbq_array << holiday if holiday_hash[season][holiday].to_s.include?("BBQ")
    end
  end
  bbq_array
end

puts all_holidays_with_bbq(holiday_hash)





