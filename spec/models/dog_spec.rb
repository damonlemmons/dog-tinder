require 'rails_helper'

RSpec.describe Dog, type: :model do
    it "should validate name" do
      dog = Dog.create
      expect(dog.errors[:name]).to_not be_empty
    end

    it "should validate age" do
      dog = Dog.create
      expect(dog.errors[:age]).to_not be_empty
    end

    it "should validate enjoys" do
      dog = Dog.create
      expect(dog.errors[:enjoys]).to_not be_empty
    end

    it "should validate length" do
      dog = Dog.create
      print dog.errors[:enjoys][1].class
      expect(dog.errors[:enjoys]).to_not be_empty
      expect(dog.errors[:enjoys]).to include("is too short (minimum is 10 characters)")
    end

end
