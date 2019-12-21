require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('create a word path', {:type => :feature}) do
  it('creates an word and then goes to the word definition page') do
    word = Word.new("Hi", nil)
    word.save_word
    visit("/words/#{word.word_id}/definitions/new")
    fill_in('definition_name', :with => 'a way to greet someone')
    click_on('Go!')
    expect(page).to have_content('a way to greet someone')
  end
end

describe('edit a word', {:type => :feature}) do
  it('creates an word and then edits it') do
    word = Word.new("Hi", nil)
    word.save_word
    visit("/words/#{word.word_id}/edit")
    fill_in('name', :with => 'howdy')
    click_on('Update')
    expect(page).to have_content('howdy')
  end
end
