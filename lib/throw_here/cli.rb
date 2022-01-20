class ThrowHere::CLI

    def call
        intro
        ThrowHere::Scraper.new.scrape_page
        start
        over?
    end
    
    def intro
        puts "\nWelcome to Throw Here!"
        puts "\n"
        puts "Please wait while we search the internet for the most up to date info on Disc Golf Courses!"
        puts "\n"
    end
    
    def print_states
        @states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']

        @states.each.with_index(1) do |state, index|
            puts "#{index}. #{state}"
        end
    end

    def get_user_state
        chosen_state = gets.strip.to_i
        if valid_input(chosen_state, @states) == true
            show_courses_for(chosen_state) 
        else
            puts "Please enter a number between 1 and 50."
            get_user_state
        end
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_courses_for(chosen_state)
        @state = @states[chosen_state -1]
        puts "\n=========================|Here are the courses in the state of #{@state}.|========================="
        puts "\n"
    end

    def print_courses
        ThrowHere::Course.all.each do |course|
            if @state == course.state
                puts "State: #{course.state}."
                puts "Course name: #{course.name}."
                puts "Course city: #{course.city}."
                puts "Number of holes: #{course.num_of_holes}."
                puts "\n"
            end
        end
    end

    def start
        puts " "
        print_states
        puts "\nChoose a state by pressing the state's corresponding number. (Example: Press '1' for Alabama, Press '50' for Wyoming.)"
        get_user_state
        print_courses
    end

    def over?
        puts 'Would you like to look at courses for another state? Y/N'
        run_again = gets.strip.downcase

        if run_again == "y"
            start
            over?
        elsif run_again == "n"
            puts "Thanks for using Throw Here. Goodbye!"
            exit
        else 
            puts ""
            puts "Please enter Y or N"
            puts "\n"
            over?
            exit
        end
    end
end