class Build::Html
  SEASONS = {
    2015 => '2015.html',
    2016 => '2016.html',
    2017 => 'index.html'
  }

  TIME_FORMAT = '%a, %d %b %Y %-l:%M %p %z'

  def build
    haml_context = Build::HamlContext.new(Build.build_path)

    source = Models::Persistence.load(Build.source_path)

    SEASONS.each_pair do |year, file|
      (Build.output_path + file).write(haml_context.render('index.haml', context(source, year)))
    end
  end

  def context(source, year)
    {
      leagues: source.leagues,
      matches: source.matches.select { |match| match.rtime.year == year },
      title: "#{year} League Schedule",
      generated: Time.now.iso8601,
      data_generated: Build.source_path.mtime.iso8601
    }
  end
end