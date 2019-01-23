
class View

  def create_gossip
    puts "T'es qui ?"
    print ">"
    author = gets.chomp.to_s
    puts ""
    puts "Ok, #{author}, quel est ton potin ?"
    print ">"
    content = gets.chomp.to_s  
    puts ""  
    return params = {"author" => author, "content" => content}
  end

  def index_gossips(gossips)
    gossips.each_with_index do |gossip, i|
      puts "#{i+1}. #{gossip.author.red} : '#{gossip.content.blue}'"
    end
    puts ""
  end

end
