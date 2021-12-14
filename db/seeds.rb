ActorMovie.destroy_all
Actor.destroy_all
Movie.destroy_all
Studio.destroy_all

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
