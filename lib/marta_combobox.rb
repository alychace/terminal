# Copyright Alexandra Chace 2014-2016

# This file is part of Terminal.

# Terminal is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Terminal is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Terminal.  If not, see <http://www.gnu.org/licenses/>.

require 'Qt'

class MARTAComboBox < Qt::ComboBox
  def initialize(x)
    super(x)
  end

  def include?(entry)
    all_items = []
    for i in 0..(self.count)
      all_items.push(self.itemText(i))
    end
    return all_items.include?(entry)
  end
end
