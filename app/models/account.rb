class Account < ActiveRecord::Base
validates :a_amount, numericality: { greater_than_or_equal_to: 0 }
def self.search(search)
  if search
    find(:all, :conditions => ['a_name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end
end
