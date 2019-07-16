require "pry"

def game_hash
  teams = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1 
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7 
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15 
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5 
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1 
        }  
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2 
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10 
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5 
        },
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0 
        },
        {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12 
        }  
      ]
    }
  }
  return teams
end

def num_points_scored(player_name)
  game_hash.each do |teamlocation, team_data|
    team_data.each do |attribute, data|
      #binding.pry
      if attribute == :players
        game_hash[teamlocation][attribute].each do |playerattributes|
        #binding.pry
        if playerattributes[:player_name].include?(player_name)
            #binding.pry
            return playerattributes[:points]
            end
        end  
      end  
    end
  end  
  return "Player not available"    
end  

def shoe_size(player_name)
  game_hash.each do |teamlocation, team_data|
    team_data.each do |attribute, data|
      #binding.pry
      if attribute == :players
        game_hash[teamlocation][attribute].each do |playerattributes|
        #binding.pry
        if playerattributes[:player_name].include?(player_name)
            #binding.pry
            return playerattributes[:shoe]
            end
        end  
      end  
    end
  end  
  return "Player not available"    
end  

def team_colors(team_name)
  game_hash.each do |teamlocation, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name && game_hash[teamlocation][attribute] == team_name
       #binding.pry
       return game_hash[teamlocation][:colors]
      end
    end
  end
  return "Team not found"
end
        
def team_names
  teams = []
  game_hash.each do |teamlocation, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name  
        teams.push(game_hash[teamlocation][attribute])
      end
    end
  end  
  return teams
end

def player_numbers(team_name)
  teamjerseys = []
  game_hash.each do |teamlocation, team_data|
    team_data.each do |attribute, data|
      if game_hash[teamlocation][attribute] == team_name
        game_hash[teamlocation][:players].each do |playerstats|
        teamjerseys.push(playerstats[:number])
        #binding.pry
        end
      end
    #binding.pry  
    end
  end  
  return teamjerseys
end

def player_stats(player_name)
  new_hash = {}
  game_hash.each do |teamlocation, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |playerattributes|
         #binding.pry
         if playerattributes[:player_name] == player_name
           #binding.pry
           new_hash = playerattributes.delete_if do |key, value|
             key == :player_name
           end
         end
        end 
      end
    end
  end
  return new_hash
end