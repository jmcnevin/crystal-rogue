require "./rogue/*"

module Rogue
end

new_session = Rogue::Session.new

new_session.start!
