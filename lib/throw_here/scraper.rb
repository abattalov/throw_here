require 'nokogiri'
require 'open-uri'
require 'pry'
require 'progress_bar'

require_relative './course.rb'

class Scraper

    def get_page_info
        doc = Nokogiri::HTML(open("https://www.pdga.com/course-directory/advanced?title=&field_course_location_country=US&field_course_location_locality=&field_course_location_administrative_area=All&field_course_location_postal_code=&field_course_type_value=All&rating_value=All&field_course_holes_value=All&field_course_total_length_value=All&field_course_target_type_value=All&field_course_tee_type_value=All&field_location_type_value=All&field_course_camping_value=All&field_course_facilities_value=All&field_course_fees_value=All&field_course_handicap_value=All&field_course_private_value=All&field_course_signage_value=All&field_cart_friendly_value=All"))
    
        per_page = doc.css('.view-footer').text.split(' ')[3].to_i
        total_courses = doc.css('.view-footer').text.split(' ').last.to_i
        last_page = (total_courses.to_f / per_page.to_f).round
        @page = 0
        @final_page = last_page - 1
    end

    def scrape_page
        get_page_info
        
        
        while @page <= @final_page
            pagination_doc = Nokogiri::HTML(open("https://www.pdga.com/course-directory/advanced?title=&field_course_location_country=US&field_course_location_locality=&field_course_location_administrative_area=All&field_course_location_postal_code=&field_course_type_value=All&rating_value=All&field_course_holes_value=All&field_course_total_length_value=All&field_course_target_type_value=All&field_course_tee_type_value=All&field_location_type_value=All&field_course_camping_value=All&field_course_facilities_value=All&field_course_fees_value=All&field_course_handicap_value=All&field_course_private_value=All&field_course_signage_value=All&field_cart_friendly_value=All&page=#{@page}"))
                        
            tbody_contents = pagination_doc.css('tbody')[0]
    
            name = tbody_contents.css('.views-field.views-field-title')
            city = tbody_contents.css('.views-field.views-field-field-course-location')
            state = tbody_contents.css('.views-field.views-field-field-course-location-2')
            num_of_holes = tbody_contents.css('.views-field.views-field-field-course-holes')
            
            counter = 0
            
            name.each do |listing|
                course = Course.new
                course.name = name[counter].css('a').text.strip
                course.city = city[counter].text.strip
                course.state = state[counter].text.strip
                course.num_of_holes = num_of_holes[counter].text.strip
                counter += 1
                # puts course.name
            end

            @page += 1
            puts "\rparsed all info on #{@page}"
        end

        @page       
    end

end

Scraper.new.scrape_page