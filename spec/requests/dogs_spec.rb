require 'rails_helper'

describe "Dogs API" do
  it "gets a list of Dogs" do
    # Create a new cat in the Test Database (not the same one as development)
    Dog.create(name: 'Oodie', age: 2, enjoys: 'Tormenting Garfield')

    # Make a request to the API
    get '/dogs'

    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)

    # Assure that we got a successful response
    expect(response).to be_success

    # Assure that we got one result back as expected
    expect(json.length).to eq 1
  end
end
