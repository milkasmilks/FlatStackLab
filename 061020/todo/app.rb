require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'byebug'
require './ToDo.rb'

configure {set :server, :puma}

get '/' do
  "My ToDo list"
end

get "/todos" do
	@result = ToDo.all

	erb :index
end

get "/todos/new" do
	erb :new
end

get "/todos/:id/edit" do
	@result = ToDo.where(params).first

	erb :edit
end

get "/todos/:id" do
	@result = ToDo.where(params).first

	erb :show
end

post "/todos" do
	if params["custom_method"] == "DELETE"
		@result = ToDo.where(params).first.delete

		redirect to("/todos")
	else
		@result = ToDo.new(params).save

		redirect to("/todos/#{@result.first['id']}")
	end
end

post "todos/:id" do
	if params["custom_method"] == "PUT"
		@result = ToDo.where(params).first.update(params)

		redirect to("/todos/#{params['id']}")
	end
end
