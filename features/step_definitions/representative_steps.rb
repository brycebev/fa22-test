

Given /the following representatives exist/ do |representatives_table|
  representatives_table.hashes.each do |representative|
    Representative.create!(representative)
  end
end