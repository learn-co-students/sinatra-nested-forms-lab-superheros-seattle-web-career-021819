require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do

      erb :index
    end

    post "/teams" do
      binding.pry
      @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
      members = params[:team][:members]

      @superheroes = members.collect do |params|
        Superhero.new({name: params[:name], power: params[:power], bio: params[:bio]})
      end


      erb :team
    end


end
