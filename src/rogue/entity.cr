module Rogue
  class Entity
    getter :hp
    getter :strength
    getter :defense
    getter :session

    def initialize(@session : Rogue::Session, @hp : Int32 = 1, @strength : Int32 = 5, @defense : Int32 = 3)
    end

    def to_s
      "Entity"
    end

    def attack(entity : Entity)
      return false if dead? || entity.dead?
      damage = Calculator.damage(strength, entity.defense)
      entity.damage(damage)
      session.report("#{self.to_s} attacked #{entity.to_s} for #{damage} damage.")
      session.report("#{entity.to_s} is dead.") if entity.dead?
      true
    end

    def damage(hp : Int32)
      @hp -= hp
    end

    def dead?
      @hp <= 0
    end
  end
end
