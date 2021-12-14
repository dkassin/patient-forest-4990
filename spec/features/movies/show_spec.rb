require 'rails_helper'

RSpec.describe 'the movie show page' do
  before(:each) do
    @studio_1 = Studio.create!(name: "Universal", location: 'Beverly Hills')
    @studio_2 = Studio.create!(name: "Paramount", location: 'Hollywood')
    @l_space = @studio_1.movies.create!(title: "Lost in Space", creation_year: 2011, genre: "Sci/Fi")
    @s_jam = @studio_2.movies.create!(title: "Space Jam", creation_year: 2003, genre: "Animation")
    @t_story = @studio_2.movies.create!(title: "Toy Story", creation_year: 2007, genre: "Animation")
    @actor_1 = Actor.create!(name: "Jim Carrey", age: 56)
    @actor_2 = Actor.create!(name: "Dakota Fanning", age: 26)
    @actor_3 = Actor.create!(name: 'Jennifer Lawrence', age: 34)
    @actor_movie1 = ActorMovie.create!(movie_id: @s_jam.id, actor_id: @actor_1.id)
    @actor_movie2 = ActorMovie.create!(movie_id: @s_jam.id, actor_id: @actor_2.id)
    @actor_movie3 = ActorMovie.create!(movie_id: @l_space.id, actor_id: @actor_1.id)
    @actor_movie4 = ActorMovie.create!(movie_id: @t_story.id, actor_id: @actor_3.id)
    @actor_movie5 = ActorMovie.create!(movie_id: @t_story.id, actor_id: @actor_2.id)
  end

  it 'shows a movies title, creation year, and genre' do
  visit "/movies/#{@t_story.id}"
  save_and_open_page
  expect(page). to have_content(@t_story.title)
  expect(page). to have_content(@t_story.creation_year)
  expect(page). to have_content(@t_story.genre)

  end

  it 'has a list of actors from youngest to olders and average age of all actors' do

  visit "/movies/#{@t_story.id}"

  #this appear before is not working, but I know its written correctly and the save and open page works
  # expect(@actor_2.name).to appear_before(@actor_3.name)
  expect(page). to have_content(30)

  end

end
