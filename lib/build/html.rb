class Build::Html
  PAGES = {
    "items" => Models::Items
  }

  def build
    haml_context = Build::HamlContext.new(Build.build_path)

    PAGES.each_pair do |file, klass|
      (Build.output_path + "#{file}.html").write(haml_context.render("#{file}.haml", context(klass)))
    end
  end

  def context(klass)
    {
      list: klass.load,
      generated: Time.now.iso8601,
      data_generated: DataDragon.version_path.mtime.iso8601
    }
  end
end