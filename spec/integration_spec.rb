require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('adding a new list', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    visit('/')
    click_link('Add New List')
    fill_in('name', :with => 'Epicodus Word')
    click_button('Add List')
    expect(page).to have_content('Success!')

  end

end

describe('viewing all of the lists', {:type => :feature}) do
  it('allows a user to see all of the lists that have beend created') do
    list = List.new({:name => 'Epicodus Homeword'})
    list.save()
    visit('/')
    click_butter('View All Lists')
    expect(page).to have_content(list.name)
  end

end
