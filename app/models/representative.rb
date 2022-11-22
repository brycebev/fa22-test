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
      #ADDED IN for Part 1
      if Representative.where(name: official.name).exists?
        rep = Representative.where(name: official.name)[0]
        reps.push(rep)
        next
      end


      #END
      rep = Representative.create!({ name: official.name, ocdid: ocdid_temp,
          title: title_temp })
      reps.push(rep)
    end

    reps
  end
end
