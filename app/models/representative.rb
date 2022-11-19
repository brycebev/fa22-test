# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      ocdid_temp = ''
      title_temp = ''
      
      rep_info.offices.each do |office|
        if office.official_indices.include? index
          title_temp = office.name
          ocdid_temp = office.division_id
        end
      end

      temp_street = ''
      temp_city = ''
      temp_state = ''
      temp_zip = ''

      if (official.address and !official.address.empty?)
        address = official.address[0]
        temp_street = address.line1
        temp_city = address.city
        temp_state = address.state
        temp_zip = address.zip
      end

      temp_photo = ''
      if (official.photo_url)
        temp_photo = official.photo_url
      end

      rep = Representative.create!({ name: official.name, ocdid: ocdid_temp,
          title: title_temp, street: temp_street, 
          city: temp_city, state: temp_state, 
          zip: temp_zip, political_party: official.party,
          photo: temp_photo}
          )
      reps.push(rep)
    end

    reps
  end
end
