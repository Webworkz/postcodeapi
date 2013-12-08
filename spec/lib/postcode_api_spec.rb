require 'spec_helper'

describe Postcodeapi do
  it 'should remove spaces from zipcode' do
    Postcodeapi.format_zipcode("1234 AB").should eq "1234AB"
  end

  it 'should upcase the zipcode' do
    Postcodeapi.format_zipcode("1234ab").should eq "1234AB"
  end

  it 'should raise an exception' do
    expect { Postcodeapi.format_zipcode(nil) }.to raise_error
    expect { Postcodeapi.format_zipcode("") }.to raise_error
    expect { Postcodeapi.format_zipcode("111") }.to raise_error
    expect { Postcodeapi.format_zipcode("1111A") }.to raise_error
    expect { Postcodeapi.format_zipcode("11111A") }.to raise_error
    expect { Postcodeapi.format_zipcode("AAAA") }.to raise_error
    expect { Postcodeapi.format_zipcode("11AA") }.to raise_error
  end

  it 'should return an address result' do
    VCR.use_cassette('get_street', :allow_playback_repeats => true) do
      json_response_mock = '{
          "success": true,
          "resource": {
              "street": "Wilhelminapark",
              "postcode": "5041EB",
              "town": "Tilburg",
              "latitude": 51.9401,
              "longitude": 5.61531,
              "x": 133505,
              "y": 397537
          }
      }'
      res = JSON.parse(json_response_mock.to_str,{symbolize_names: true})
      Postcodeapi.get_street("5041EB").should eq OpenStruct.new(res[:resource])
      Postcodeapi.get_street("5041EB").street.should eq "Wilhelminapark"
    end
  end


  it 'should return correct version string' do
    Postcodeapi.version_string.should eq "Postcodeapi version #{Postcodeapi::VERSION}"
  end
end