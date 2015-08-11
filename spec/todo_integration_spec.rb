require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('todo list execution path', {:type => :feature}) do
  it('takes a todo item and gives a success message') do
    visit('/')
    fill_in('description', :with => 'commit the files')
    click_button('Add Task')
    expect(page).to have_content('The task has been submitted!')
  end

  it('takes a todo item and gives a success message') do
    visit('/')
    fill_in('description', :with => 'commit the files')
    click_button('Add Task')
    expect(page).to have_content('The task has been submitted!')
    click_link_or_button('Back')
    expect(page).to have_content('commit the files')
  end
end
