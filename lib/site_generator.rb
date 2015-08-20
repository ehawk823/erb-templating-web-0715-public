class SiteGenerator
  def make_index!
    # File.open("a_file", "w") do |f|
    File.open('_site/index.html', "a+") do |f|
      f.write '
      <!DOCTYPE html>
      <html>
        <head>
          <title>Movies</title>
        </head>
        <body>
          <ul>
      '
    end
      movie_array = Movie.make_movies!
      movie_array.each do |movie|
        movie_url = movie.url
        File.open('_site/index.html', "a+") do |f|
          f.write "<li><a href=\"movies/#{movie_url}\">#{movie.title}</a></li>"
        end
      end

    File.open('_site/index.html', "a+") do |f|
    f.write  '
        </ul>
      </body>
    </html>
      '
    end

  end

    def generate_pages!
        template = File.read('lib/templates/movie.html.erb')
        erb = ERB.new(template)
        Movie.all.each do |m|
          movie_page = erb.result(binding)
          File.open("_site/movies/#{m.url}", "w+") {|f| f.puts movie_page}
        end
    end



end
