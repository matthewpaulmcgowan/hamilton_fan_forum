$(document).ready(function(event){
  indexMoreInfo();
});

var indexMoreInfo = function(){
  $("#indexNext").click(function(event) {
    event.preventDefault();
    var userPath = parseUserPath($("#indexNext"));
  //  debugger;
  //  $.get("users/" + userID + "/posts/.json", function(data) {
  //    var post = data["user"];
  //    debugger;
  //    var postInfo = "";
      //games.forEach(function(game){
      //  $('#games').append("<li " + "data-gameid=" + game.id + ">" + game.state + "</li>");
      //});



    //  $(".postContent").text(post["author"]["name"]);
    //});
  });
};

var parseUserPath = function(input){
  debugger;

};
