time = Time.new
month = time.month
day = time.day
if (time.month < 10)
    month = "0#{month}"
end

if (day < 10)
    day = "0#{day}"
end

date = "#{time.year}-#{month}-#{day}"

Gem::Specification.new do |s|
    s.name        = 'terminal'
    s.license     = 'GPL'
    s.executables << 'terminal'
    s.version     = '0.4.1'
    s.date        = date
    s.summary     = 'Shows arrival times for MARTA trains in the Atlanta area.'
    s.description = "Uses MARTA's REST API to get train information and shows them in a clean Qt and HTML based interface."
    s.authors     = ['Alexandra Chace']
    s.email       = 'achace@student.gsu.edu'
    s.homepage    = 'http://leximch.wordpress.com'
    s.files       = ["lib/terminal.rb", "lib/marta.rb", "lib/marta_combobox.rb", "lib/icon.png"]
    s.add_runtime_dependency 'qtbindings'
end
