require('spec_helper')

describe(Todo) do
  describe(".all") do
    it("is empty at first") do
      expect(Todo.all()).to(eq([]))
    end

    it('returns items in order of due_date; the closest by date being presented first') do
      test_task = Todo.new({:description => "write new spec", :list_id => 1, :due_date => "2016-02-14 00:00:00"})
      test_task.save()
      test_task2 = Todo.new({:description => "write new spec", :list_id => 1, :due_date => "2016-02-13 00:00:00"})
      test_task2.save()
      test_task3 = Todo.new({:description => "write new spec", :list_id => 1, :due_date => "2016-02-15 00:00:00"})
      test_task3.save()
      expect(Todo.all()).to(eq([test_task2, test_task, test_task3]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Todo.new({:description => "write new spec", :list_id => 1, :due_date => "2015-02-14 00:00:00"})
      test_task.save()
      expect(Todo.all()).to(eq([test_task]))
    end
  end

  describe("#description") do
    it("lets you give a description") do
      test_task = Todo.new({:description => "commit the code", :list_id => 1, :due_date => "2015-02-14 00:00:00"})
      expect(test_task.description()).to(eq("commit the code"))
    end
  end

  describe('#list_id') do
    it('lets you read the list ID out') do
      test_task = Todo.new({:description => "learn SQL", :list_id => 1,:due_date => "2015-02-14 00:00:00"})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      todo1 = Todo.new({:description => "learn SQL", :list_id => 1, :due_date => "2015-02-14 00:00:00"})
      todo2 = Todo.new({:description => "learn SQL", :list_id => 1, :due_date => "2015-02-14 00:00:00"})
      expect(todo1).to(eq(todo2))
    end
  end
end
