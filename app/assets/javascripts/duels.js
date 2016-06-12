


var duelAlexHam = function(){
  $(".duelSelector").click(function(event){
    event.preventDefault();
    var duel_url = event["target"]["pathname"];
    debugger;
    var duelCompetitor = event["target"]["outerText"];
    var outcome = "";
    $.ajax({
       url: duel_url,
       method: "post",
       dataType: "json",
       data: {competitor: duelCompetitor},
       success: function(response) {
         debugger;
       }
     })
    debugger;
  })
}

$(document).ready(function(){
  duelAlexHam();
})
