require 'rails_helper'

RSpec.describe 'the studio index' do
  before(:each) do
    @studio_1 = Studio.create!(name: "Universal", location: 'Beverly Hills')
    @studio_2 = Studio.create!(name: "Paramount", location: 'Hollywood')
    @l_space = @studio_1.movies.create!(title: "Lost in Space", creation_year: 2011, genre: "Sci/Fi")
    @s_jam = @studio_2.movies.create!(title: "Space Jam", creation_year: 2003, genre: "Animation")
    @t_story = @studio_2.movies.create!(title: "Toy Story", creation_year: 2007, genre: "Animation")
  end

  it 'lists a studios name and location' do
    visit '/studios'

    expect(page). to have_content(@studio_1.name)
    expect(page). to have_content(@studio_1.location)
    expect(page). to have_content(@studio_2.name)
    expect(page). to have_content(@studio_2.location)
  end

  it 'also have a list of titles of all a studios movies under its name and location' do
    visit '/studios'

    expect(page). to have_content(@l_space.name)
    expect(page). to have_content(@s_jam.name)
    expect(page). to have_content(@t_story.name)
  end
end
