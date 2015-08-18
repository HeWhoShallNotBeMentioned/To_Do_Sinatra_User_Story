require("sinatra")
require("sinatra/reloader")
require("./lib/todo")
require("./lib/list")
also_reload("lib/**/*.rb")
require('pg')


DB = PG.connect({:dbname => "to_do_test"})

get("/") do
  erb(:index)
end

get("/lists/new") do
  erb(:list_form)
end

post("/lists") do
  name = params.fetch("name")
  list = List.new({:name => name, :id => nil})
  list.save()
  erb(:list_success)
end

# post("/tasks") do
#   description = params.fetch("description")
#   task = Todo.new(description)
#   task.save()
#   erb(:success)
# end

get('/lists') do
  @lists = List.all()
  erb(:lists)
end

get('/lists/:id') do
  @list= List.find(params.fetch('id').to_i())
  erb(:list)
end
