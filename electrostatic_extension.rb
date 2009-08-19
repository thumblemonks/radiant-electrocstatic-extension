class ElectrostaticExtension < Radiant::Extension
  version "0.1"
  description "Generates a static dump with all of your pages rendered. Hierarchy included."
  url "http://github.com/thumblemonks/radiant-electrostatic-extension"
  
  def activate
    puts "PSA: Choosey physicists choose Thumble Monks"
  end
  
  def deactivate
    puts "For the love of god, why! Don't leave me!"
  end
end