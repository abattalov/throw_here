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
    end

    def get_course_info
        #scrape PDGA website
        @states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas']
    end
    
    def print_states
        #list states
        @states.each.with_index(1) do |state, index|
            puts "#{index}. #{state}"
        end
    end

    def get_user_state
        chosen_state = gets.strip.to_i
        show_courses_for(chosen_state) if valid_input(chosen_state, @states)
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_courses_for(chosen_state)
        state = @states[chosen_state -1]
        puts "Here are the courses in the state of #{state}."
    end
end