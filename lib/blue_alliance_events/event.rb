class BlueAllianceEvents::Event
  attr_accessor :name, :date, :location, :site

  def self.all
    #scrape The Blue Alliance
    events = []
    events << self.scrape_events
    events
  end

  def self.scrape_events
    doc = Nokogiri::HTML(open("https://www.thebluealliance.com/"))
      
    event = self.new
    event.name = doc.search("td a").first.text
    event.date = doc.search("td time").first.text
    event.location = doc.search("td small").first.text
    event_site = doc.search("td a").first.attr("href")
    event.site = "https://www.thebluealliance.com#{event_site}"

    event
  end
end

#event_1 = self.new
#event_1.name = "Great Lakes Bay Bot Bash"
#event_1.date = "Oct 13th to 14th, 2017"
#event_1.location = "Midland, MI, USA"
#event_1.site = "https://www.thebluealliance.com/event/2017glbbb"


#event_2 = self.new
#event_2.name = "Minnesota Robotics Invitational"
#event_2.date = "Oct 14th, 2017"
#event_2.location = "Little Canada, MN, USA"
#event_2.site = "https://www.thebluealliance.com/event/2017mnri"

#[event_1, event_2]

#  events = doc.search("tr").attr("itemtype")
