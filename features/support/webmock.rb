require 'webmock/cucumber'

Before do
  WebMock.disable_net_connect!(allow_localhost: true)

  WebMock.stub_request(:any, "https://civicinfo.googleapis.com/civicinfo/v2/representatives?address=berkeley&key=AIzaSyBCYm0dns5NYBGVnlhyWRCBdlro-gdIKPU").
          to_return(headers: {content_type: 'application/json'}, 
            body: File.new(Rails.root + "features/support/fixtures/berkeley_representative.json"))
  WebMock.stub_request(:any, "https://civicinfo.googleapis.com/civicinfo/v2/representatives?address=Big%20Horn%20County&key=AIzaSyBCYm0dns5NYBGVnlhyWRCBdlro-gdIKPU").
          to_return(headers: {content_type: 'application/json'}, 
            body: File.new(Rails.root + "features/support/fixtures/wyoming_counties.json"))

end