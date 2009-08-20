#
# All the right stuff

def render_pages(static_path)
  Page.all.each do |p|
    if (body = p.render)
      dir, filename = p.url, "index.html"
      dir, filename = p.parent.url, p.slug if p.slug =~ /\.[^.]+$/i # File with extension (e.g. styles.css)
      FileUtils.mkdir_p(File.join(static_path, dir))
      File.open(File.join(static_path, dir, filename), 'w') { |io| io.print(body) }
    else
      puts "Could not render #{p.id} - #{p.url}"
    end
  end
end

def copy_in_public(static_path)
  FileUtils.cp_r('public/.', static_path)
end

namespace :electrostatic do
  desc "Generate rendered Pages, store in ./tmp directory, copy public directory in"
  task :build => :environment do
    static_path = File.join('tmp', 'static')
    render_pages(static_path)
    copy_in_public(static_path)
  end
end

#
# Extension administration

namespace :radiant do
  namespace :extensions do
    namespace :electrostatic do
      
      desc "Runs the migration of the Ecstatic extension"
      task :migrate => :environment do
        puts "This extension does not affect the database. Nothing done."
      end
      
      desc "Copies public assets of the Ecstatic extension to the instance public/ directory."
      task :update => :environment do
        puts "This extension has no public assets.  Nothing done."
      end  
    end
  end
end
