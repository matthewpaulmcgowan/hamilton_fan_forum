class Duel < ActiveRecord::Base
  belongs_to :user
  
  def self.duelers
    {alexander_hamilton: 40,aaron_burr: 60,button_gwinnett: 25}
  end
end
