require('rspec')
require('todo')

describe(Todo) do
  describe("#description") do
    it("lets you give a description") do
      test_task = Todo.new("commit the code")
      expect(test_task.description()).to(eq("commit the code"))
    end
  end
end
