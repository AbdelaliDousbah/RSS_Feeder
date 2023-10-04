require 'rss'
require 'open-uri'

puts "Welcome to My Fancy Terminal RSS Feeder"
sleep(2)
puts "Please enter the URL of the RSS feed you want to read."
sleep(1)
puts "If you don't have a URL, you can press Enter to use the default feed."
url = gets.chomp
if url.empty? 
  url = 'https://rss.nytimes.com/services/xml/rss/nyt/Africa.xml' 
  puts "No URL provided. Using the default feed."
end

begin
  URI.open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    puts "Title: #{feed.channel.title}"
    feed.items.each do |item|
      puts "Item: #{item.title}"
      puts "*-*-*-*-*-*-*-"
    end
  end
rescue StandardError => e
  puts "Error occurred while fetching or parsing the RSS feed: #{e.message}"
end

sleep(1)
puts "**********************************************************"
puts "Thank you for using My Fancy Terminal RSS Feeder. AbdelaliDousbah!"
