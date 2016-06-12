class Duel < ActiveRecord::Base
  belongs_to :user

  def determine_outcome
    @user = User.find(self.user_id)
    if self.competitor === "Alexander Hamilton"
      if @user.dueling_ability > 40
        self.outcome = "Win"
      elsif @user.dueling_ability < 20
        self.outcome = "Lose"
      else
        self.outcome = "Draw"
      end
    elsif self.competitor === "Aaron Burr"
      if @user.dueling_ability > 70
        self.outcome = "Win"
      elsif @user.dueling_ability < 50
        self.outcome = "Lose"
      else
        self.outcome = "Draw"
      end
    else
      if @user.dueling_ability > 25
        self.outcome = "Win"
      elsif @user.dueling_ability < 5
        self.outcome = "Lose"
      else
        self.outcome = "Draw"
      end
    end
  end

end
