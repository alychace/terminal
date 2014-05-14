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
