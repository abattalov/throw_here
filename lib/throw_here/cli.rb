class ThrowHere::CLI

    def call
        puts "\nWelcome to Throw Here!"
        puts "\n"
        #get_courses
        #get_user_state or city... or zipcode
        #get_state(state)
        #list_courses
        get_course_info
        print_states
        puts "\nChoose a state by pressing the state's corresponding number. (Example: Press '1' for Alabama)"
        get_user_state
        print_courses
    end

    def get_course_info
        #scrape PDGA website
        @states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
        Scraper.new
    end
    
    def print_states
        #list states
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
        puts "Here are the courses in the state of #{@state}."
    end

    def print_courses
        Course.all.each do |course|
            if @state == course.state
                puts "\nCourse name: #{course.name}."
                puts "Course city: #{course.city}."
                puts "Number of holes: #{course.num_of_holes}."
                puts "\n\n"
            end
        end
    end
end