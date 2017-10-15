class TBACurrentEvents::CLI

  def call
    puts "FIRST Robotics Competition Current Events"
    list_events
    choose_event
    goodbye
  end

  def list_events
    #scrap events
    puts <<-DOC
      1. Great Lakes Bay Bot Bash - date - location - event info link - webcast link
      2. RiverRage21 - date - location - event info link - webcast link
    DOC
  end

  def choose_event
    input = nil
    while input != "exit"
      puts "Enter the number of the event you would like more information on, type list to see the events again or exit to leave"
      input = gets.strip.downcase
      case input
      when "1"
        puts "more info on event 1"
      when "2"
        puts "more info on event 1"
      when "list"
        list_events
      else puts "Enter the number of the event you would like more information on, type list to see the events again or exit to leave"
      end
    end
  end

  def goodbye
    puts 'Hope to see you there!!!'
  end

end
