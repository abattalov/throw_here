require 'nokogiri'
require 'open-uri'
require 'pry'
require 'progress_bar'

require_relative './course.rb'

class ThrowHere::Scraper

    def scrape_page
        get_index_page_info
        get_next_page_info  
    end
    
    def get_index_page_info
        doc = Nokogiri::HTML(open("https://www.pdga.com/course-directory/advanced?title=&field_course_location_country=US&field_course_location_locality=&field_course_location_administrative_area=All&field_course_location_postal_code=&field_course_type_value=All&rating_value=All&field_course_holes_value=All&field_course_total_length_value=All&field_course_target_type_value=All&field_course_tee_type_value=All&field_location_type_value=All&field_course_camping_value=All&field_course_facilities_value=All&field_course_fees_value=All&field_course_handicap_value=All&field_course_private_value=All&field_course_signage_value=All&field_cart_friendly_value=All"))
    
        per_page = doc.css('.view-footer').text.split(' ')[3].to_i
        total_courses = doc.css('.view-footer').text.split(' ').last.to_i
        last_page = (total_courses.to_f / per_page.to_f).round
        @page = 0
        @final_page = last_page - 1
    end

    def get_next_page_info

        while @page <= @final_page
            pagination_doc = Nokogiri::HTML(open("https://www.pdga.com/course-directory/advanced?title=&field_course_location_country=US&field_course_location_locality=&field_course_location_administrative_area=All&field_course_location_postal_code=&field_course_type_value=All&rating_value=All&field_course_holes_value=All&field_course_total_length_value=All&field_course_target_type_value=All&field_course_tee_type_value=All&field_location_type_value=All&field_course_camping_value=All&field_course_facilities_value=All&field_course_fees_value=All&field_course_handicap_value=All&field_course_private_value=All&field_course_signage_value=All&field_cart_friendly_value=All&page=#{@page}"))
                        
            tbody_contents = pagination_doc.css('tbody')
    
            @name = tbody_contents.css('.views-field.views-field-title')
            @city = tbody_contents.css('.views-field.views-field-field-course-location')
            @state = tbody_contents.css('.views-field.views-field-field-course-location-2')
            @num_of_holes = tbody_contents.css('.views-field.views-field-field-course-holes')
            
            @counter = 0

            get_course_details
            
            bar = ProgressBar.new(@final_page)

            sleep 0.1
            bar.increment! @page
        end
    end

    def get_course_details
        @name.each do
        course = ThrowHere::Course.new
        course.name = @name[@counter].css('a').text.strip
        course.city = @city[@counter].text.strip
        course.state = @state[@counter].text.strip
        course.num_of_holes = @num_of_holes[@counter].text.strip
        @counter += 1
        end

        @page += 1
    end
end
