var Duel = function(outcome,competitor,id,userID){
  this.outcome = outcome;
  this.competitor = competitor;
  this.id = id;
  this.userID = userID;
}

Duel.prototype.formatDuel = function(outcome,competitor){
  return "Outcome: " + outcome + "<br>" + "Competitor: " + competitor + "<br>";
}


var duelSelector = function(){
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
         var formattedDuel = duel.formatDuel(duel.outcome,duel.competitor);
         debugger;
         $("#" + duelCompetitor).html(formattedDuel);
       }
     });
  });
};

$(document).ready(function(){
  duelSelector();
})
