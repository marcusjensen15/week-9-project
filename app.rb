require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/dictionary')
require('pry')
also_reload('lib/**/*.rb')

# get('/test/') do
#   @something = "this is a variable"
#   erb(:whatever)
# end

get('/') do
  @words = Word.all

  erb(:words)
end

get('/words') do
  @words = Word.all

  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  name = params[:word_name]
  new_word = Word.new(name, nil)
  new_word.save_word()
  @words = Word.all
  erb(:words)
end
