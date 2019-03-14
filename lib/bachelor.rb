require 'pry'
def get_first_name_of_season_winner(data, season)
  data.each do |season_key, all_contestant_info|
    if season_key == season
      all_contestant_info.each do |contestant_info|
        contestant_info.each do |info_key, info_value|
          if info_value == "Winner"
            return contestant_info["name"].split[0]
          end
        end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season_key, all_contestant_info|
    all_contestant_info.each do |contestant_info|
      contestant_info.each do |info_key, info_value|
        if info_value == occupation
          return contestant_info["name"]
        end
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  contestants_in_town = []
  data.each do |season_key, all_contestant_info|
    all_contestant_info.each do |contestant_info|
      contestant_info.each do |info_key, info_value|
        if info_value == hometown
          contestants_in_town << info_value
        end
      end
    end
  end
  return contestants_in_town.length
end

def get_occupation(data, hometown)
  data.each do |season_key, all_contestant_info|
    all_contestant_info.each do |contestant_info|
      contestant_info.each do |info_key, info_value|
        if info_value == hometown
          return contestant_info["occupation"]
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  ages = []
  data.each do |season_key, all_contestant_info|
    if season_key == season
      all_contestant_info.each do |contestant_info|
        ages << contestant_info["age"].to_i
      end
    end
  end
  return ages.inject(:+)/ages.size
end
