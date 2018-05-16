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


it "creates a dog" do
    # The params we are going to send with the request
    dog_params = {
      dog: {
        name: 'Scotty',
        age: 5,
        enjoys: 'Playing fetch'
      }
    }

    # Send the request to the server
    post '/dogs', params: dog_params

    # Assure that we get a success back
    expect(response).to be_success

    # Look up the cat we expect to be created in the Database
    new_dog = Dog.first

    # Assure that the created cat has the correct attributes
    expect(new_dog.name).to eq('Scotty')
  end
end
