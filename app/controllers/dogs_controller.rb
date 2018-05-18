class DogsController < ApplicationController

  def index
    dogs = Dog.all
    render json: dogs
  end

  def create
    dog = Dog.create(dog_params)
    puts dog.errors.messages
      if dog.valid?
        render json: dog
      else
        render json: dog.errors, status: :unprocessable_entity
      end
  end

  def dog_params
    params.require(:dog).permit(:name, :age, :enjoys)
  end

end
