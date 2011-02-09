class Hoe
  module Heroku
    VERSION = "0.0.1"

    def define_heroku_tasks

      namespace :heroku do
        desc "Create .gems manifest"
        task :dotgems do
          list = []

          self.extra_deps.each do |gem, version|
            out = []
            out << gem
            out << "--version '#{version}'" if version

            list << out.join(' ')
          end

          File.open( '.gems', 'w' ) {|f| f.puts list.join("\n") }
        end
      end

    end

  end
end
