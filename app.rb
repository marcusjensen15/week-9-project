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

get('/words/:word_id') do
  @word = Word.find(params[:word_id].to_i())
  erb(:word)
end


get('/words/:word_id/edit') do
  @word = Word.find(params[:word_id].to_i())
  erb(:edit_word)
end

patch('/words/:word_id') do
  @word = Word.find(params[:word_id].to_i())
  @word.update_word(params[:name])
  @words = Word.all
  erb(:words)
end

delete('/words/:word_id') do
  @word = Word.find(params[:word_id].to_i())
  @word.delete_word()
  @words = Word.all
  erb(:words)
end

################## Routing for definitions below

get('/words/:word_id/definitions') do
  @word = Word.find(params[:word_id].to_i())
  @definitions = @word.get_definitions
  erb(:definitions)
end

post('/words/:word_id/definitions') do
  @word = Word.find(params[:word_id].to_i())

  definition = Dictionary.new(params[:definition_name], @word.word_id, nil)
  definition.save_definition()
  @definitions = @word.get_definitions
  erb(:definitions)
end

get('/words/:word_id/definitions/new') do
  @word = Word.find(params[:word_id].to_i())
  erb(:new_definition)
end

get('/words/:word_id/definitions/:id') do
  @word = Word.find(params[:word_id].to_i())
  @definition = Dictionary.find(params[:id].to_i())
  erb(:definition)
end

get('/words/:word_id/definitions/:id/edit') do
  @word = Word.find(params[:word_id].to_i())
  @definition = Dictionary.find(params[:id].to_i())
  erb(:edit_definition)
end


patch('/words/:word_id/definitions/:id') do
  @word = Word.find(params[:word_id].to_i())
  definition = Dictionary.find(params[:id].to_i())
  definition.update_definition(params[:name])
  @definitions = @word.get_definitions
  erb(:definitions)
end



delete('/words/:word_id/definitions/:id') do
  @word = Word.find(params[:word_id].to_i())
  definition = Dictionary.find(params[:id].to_i())
  definition.delete_definition()
  @definitions = @word.get_definitions
  erb(:definitions)
end


# delete('/albums/:id/songs/:song_id') do
#   @album = Album.find(params[:id].to_i())
#   song = Song.find(params[:song_id].to_i())
#   song.delete
#   @songs = @album.get_songs
#   erb(:songs)
# end
#


# #### Routing for songs below
#



# get('/albums/:id/songs/:song_id') do
#   @album = Album.find(params[:id].to_i())
#   @song = Song.find(params[:song_id].to_i())
#   erb(:song)
# end
#
# get('/albums/:id/songs/:song_id/edit') do
#   @album = Album.find(params[:id].to_i())
#   @song = Song.find(params[:song_id].to_i())
#   erb(:edit_song)
# end
#
# delete('/albums/:id/songs/:song_id') do
#   @album = Album.find(params[:id].to_i())
#   song = Song.find(params[:song_id].to_i())
#   song.delete
#   @songs = @album.get_songs
#   erb(:songs)
# end
#

# end
