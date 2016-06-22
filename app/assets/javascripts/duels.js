var Duel = function(outcome,competitor,id,userID){
  this.outcome = outcome;
  this.competitor = competitor;
  this.id = id;
  this.userID = userID;
};

Duel.prototype.formatDuel = function(){
  return "Outcome: " + this.outcome + "<br>" + "Competitor: " + this.competitor + "<br>";
};

var formatCompetitor = function(competitor){
  return "#" + competitor.split(" ").join("").toLowerCase();
};

var duelShow = function(event){
  $(".duelShow").on("click",function(event){
    event.preventDefault();
    $(".duelVideo").show();
  });
};

var duelCreateSelector = function(){
  $(".duelSelector").click(function(event){
    event.preventDefault();
    var duel_url = event["target"]["pathname"];
    var duelCompetitor = event["target"]["outerText"];
    $.ajax({
       url: duel_url,
       method: "post",
       dataType: "json",
       data: {competitor: duelCompetitor},
       success: function(response) {
         var duel = new Duel(response["outcome"],response["competitor"],response["id"],response["user_id"]);
         var formattedDuel = duel.formatDuel();
         var formattedCompetitor = formatCompetitor(duelCompetitor);
         $(formattedCompetitor).html(formattedDuel);
       }
     });
  });
};

$(document).ready(function(){
  duelCreateSelector();
  duelShow();
});
