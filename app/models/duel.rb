class Duel < ActiveRecord::Base
  belongs_to :user
#<%=content_tag( :iframe, nil, src: "//www.youtube.com/embed/#{@duel.determine_video_link}")%>
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

  def determine_video_link
    video_link = ""
    if self.competitor === "Alexander Hamilton"
      video_link = "t0aX8Jy1tME"
    elsif self.competitor === "Aaron Burr"
      video_link = "sEH9I_oJfqY"
    else
      video_link = "uhFeQSBZUSk"
    end
    video_link
  end
end
