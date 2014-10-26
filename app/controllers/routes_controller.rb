class RoutesController < ApplicationController
  def index
    @routes_json = Route.includes(directions: [:stops]).all.to_json(include: {directions: {include: :stops} }) 
  end
end
