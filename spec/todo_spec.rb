require('rspec')
require('pg')
require('todo')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(Todo) do
  describe(".all") do
    it("is empty at first") do
      expect(Todo.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Todo.new({:description => "write new spec", :list_id => 1})
      test_task.save()
      expect(Todo.all()).to(eq([test_task]))
    end
  end

  describe("#description") do
    it("lets you give a description") do
      test_task = Todo.new({:description => "commit the code", :list_id => 1})
      expect(test_task.description()).to(eq("commit the code"))
    end
  end

  describe('#list_id') do
    it('lets you read the list ID out') do
      test_task = Todo.new({:description => "learn SQL", :list_id => 1})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      todo1 = Todo.new({:description => "learn SQL", :list_id => 1})
      todo2 = Todo.new({:description => "learn SQL", :list_id => 1})
      expect(todo1).to(eq(todo2))
    end
  end
end
