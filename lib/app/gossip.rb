
class Gossip

  attr_reader :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("db/gossip.csv", "a") do |file|
      file << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.foreach("db/gossip.csv") do |ligne|
      all_gossips << Gossip.new(ligne[0], ligne[1])
    end
    return all_gossips
  end

end
