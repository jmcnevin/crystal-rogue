module Rogue
  class Session
    def initialize
      @entities = [] of Entity

      player = Player.new(session = self, hp = 100)
      puts "Enter player name:"
      new_name = gets
      player.name = new_name || "John Doe"
      @entities << player

      @entities << Monster.new(session = self, hp = 10)

      self
    end

    def start!
      player = @entities.first
      monster = @entities.last

      until monster.dead? || player.dead?
        player.attack(monster)
        monster.attack(player)
        status
      end

      report "The end."
    end

    def report(str)
      puts "* #{str}"
    end

    def status
      @entities.each do |e|
        report "#{e.to_s} has #{e.hp} hit points."
      end

      nil
    end
  end
end
