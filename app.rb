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
  erb(:success)
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

post("/tasks") do
  description = params.fetch("description")
  list_id = params.fetch("list_id").to_i
  due_date = params.fetch("due_date")
  @list = List.find(list_id)
  @task = Todo.new({:description => description, :due_date => due_date, :list_id => list_id})
  @task.save()
  erb(:success)
end

get("/delete_task/:description") do
  description = params.fetch("description")
  erb(:success)
end
