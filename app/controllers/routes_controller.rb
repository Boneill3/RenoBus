class RoutesController < ApplicationController
  def index
    @routes_json = Route.includes(directions: [:stops]).all.to_json(include: {directions: {include: :stops} }) 
  end

  def show
    route = Rails.cache.fetch("route-#{params[:id]}") do
      Route.includes(directions: [:stops], paths: [:points]).find(params[:id]).to_json(include: {directions: {include: :stops}, paths: {include: :points}})
    end
    render json: route
  end
end
