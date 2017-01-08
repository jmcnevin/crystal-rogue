module Rogue
  class Calculator
    def self.damage(strength, defense)
      ((strength - defense) * rand).round.to_i
    end
  end
end
