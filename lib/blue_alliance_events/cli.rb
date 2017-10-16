class BlueAllianceEvents::CLI

  def call
    list_events
    choose_event
    goodbye
  end

  def list_events
    puts "The Blue Alliance FIRST Robotics Competition Current Events:"
    #scrape site
    @events = BlueAllianceEvents::Event.all
    @events.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name} - #{event.date} - #{event.location}"
    end
  end

  def choose_event
    input = nil
    while input != "exit" && input.to_i
      puts "Enter the number of the event you would like more information on, type list to see the events again or exit to leave"
      input = gets.strip.downcase

      if input.to_i > 0
        the_event = @events[input.to_i-1]
        puts puts "#{the_event.name} - #{the_event.date} - #{the_event.location} - #{the_event.site}"
      elsif input == "list"
        list_events
      else puts "Enter the number of the event you would like more information on, type list to see the events again or exit to leave"
      end
    end
  end

  def goodbye
    puts 'FRC: More than robots! Hope to see you there!'
  end

end
