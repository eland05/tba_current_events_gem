class BlueAllianceEvents::Event
  attr_accessor :name, :date, :location, :site
  @@all = []

  def self.all
    #scrape The Blue Alliance
    @@all << scrape_events
  end

  def self.scrape_events
    doc = Nokogiri::HTML(open("https://www.thebluealliance.com/"))

    event_table = doc.search("table.event-table")
    event_rows = event_table.search("tr")[1..-1]

    event_rows.each do |row|
      @@all << event = self.new
      event.name = row.search("td a").attr("title").text.strip
      event.date = row.search("td time").text
      event.location = row.search("td small").first.text
      event_site = row.search("td a").attr("href")
      event.site = "https://www.thebluealliance.com#{event_site}"
    end
  end
end

#event = self.new
#event.name = doc.search("td a").first.text
#event.date = doc.search("td time").first.text
#event.location = doc.search("td small").first.text
#event_site = doc.search("td a").first.attr("href")
#event.site = "https://www.thebluealliance.com#{event_site}"
