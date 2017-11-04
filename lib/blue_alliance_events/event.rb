class BlueAllianceEvents::Event
  attr_accessor :name, :date, :location, :site
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    #scrape The Blue Alliance
    @@all
  end

  def self.search_name(keyword)
    @@all.select do |e|
      e.name.downcase.include? "#{keyword.downcase}"
    end
  end

  def self.search_location(location)
    @@all.select do |e|
      e.location.downcase.include? "#{location.downcase}"
    end
  end
end

#event = self.new
#event.name = doc.search("td a").first.text
#event.date = doc.search("td time").first.text
#event.location = doc.search("td small").first.text
#event_site = doc.search("td a").first.attr("href")
#event.site = "https://www.thebluealliance.com#{event_site}"
