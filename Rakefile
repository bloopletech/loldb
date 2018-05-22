require_relative './lib/loldb.rb'

desc 'Download data'
task :data do
  #DataDragon::Downloader.new.download
  Seeder.new.seed
end

namespace :build do
  desc 'Build HTML page containing schedule'
  task :html do
    Build::Html.new.build
  end
end

desc 'Build complete HTML page and team icons'
task build: ['build:icons:download', 'build:icons:sprite', 'build:html']

namespace :clean do
  desc 'Delete generated HTML page and icons sprite sheet'
  task :build do
    Build::Icons.new.clean

    icons_css_path = (Build.build_path + 'css' + 'icons.css')
    icons_css_path.delete if icons_css_path.exist?

    Build::Html::SEASONS.each_pair do |year, file|
      html_path = (Build.output_path + file)
      html_path.delete if html_path.exist?
    end

    icons_png_path = (Build.output_path + 'icons.png')
    icons_png_path.delete if icons_png_path.exist?
  end
end

desc 'Start an IRB console with the project and data loaded'
task :console do
  require 'irb'
  ARGV.clear
  IRB.start
end

desc 'Load the generated HTML page in your default browser'
task :output do
  output_path = URI.join('file:///', (Build.output_path + 'index.html').realpath.to_s).to_s
  `xdg-open #{output_path}`
end

task :develop do
  exec('find . | entr rake -t build')
end

desc 'Download data and then build HTML page and icons'
task default: [:data, :build]
