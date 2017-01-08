module Rogue
  class Player < Entity
    property name = "John Doe"

    def to_s
      "Player \"#{name}\""
    end
  end
end
