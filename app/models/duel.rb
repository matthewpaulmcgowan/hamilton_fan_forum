class Duel < ActiveRecord::Base
  belongs_to :user

  def self.duelers
    {alexander_hamilton: 40,aaron_burr: 60,button_gwinnett: 25}
  end

  def determine_outcome
    @user = User.find(self.user_id)
    if self.competitor === "alexander_hamilton"
      if @user.dueling_ability > 40
        self.outcome = "Win"
      elsif @user.dueling_ability < 20
        self.outcome = "Lose"
      else
        self.outcome = "Draw"
      end
    elsif self.competitor == "aaron_burr"    
  end
end
