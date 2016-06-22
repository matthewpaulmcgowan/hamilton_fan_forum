var indexMoreInfo = function(){
  $(".indexNext").click(function(event) {
    event.preventDefault();
    var userPath = event["target"]["href"].slice(22);
    $.get(userPath + ".json", function(data) {
      var user = new User(data["id"],data["username"],data["authored_posts"]);
      var posts = user.formatPosts(user.authored_posts);
      var userID = user.id.toString();
      $("#indexContent" + userID).html(posts);
    });
  });
};
var User = function(id,username,authored_posts){
  this.id = id;
  this.username = username;
  this.authored_posts = authored_posts;
};

User.prototype.formatPosts = function(authored_posts){
  var post = "<ol>";
  for(var i = 0;i < authored_posts.length;i++){
    post += "<li>" + authored_posts[i].content + "</li> <br>";
  }
  return post += "</0l>";
};

$(document).ready(function(event){
  indexMoreInfo();
});
