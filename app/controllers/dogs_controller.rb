class DogsController < ApplicationController

  def index
    dogs = Dog.all
    render json: dogs
  end

  def create
    dog = Dog.create(dog_params)
    render json: dog
  end

  def dog_params
    params.require(:dog).permit(:name, :age, :enjoys)
  end

end
