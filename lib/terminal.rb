require 'Qt'

directory = File.dirname(__FILE__)
path = File.expand_path(File.dirname(__FILE__))
require(File.join(path, 'marta.rb'))
require(File.join(path, 'marta_combobox.rb'))

def get_icon()
	return Qt::Icon.new(File.join(File.expand_path(File.dirname(__FILE__)), 'icon.png'))
end