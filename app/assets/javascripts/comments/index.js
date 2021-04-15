$( document ).ready(function() {
  var getComments = function(){
    $(".js-get-comments-link").on("click", function(event){
      event.preventDefault();
      var postId = $(".js-post-container").data("post-id");
      var $this = $(this);
      var commentUrl = $this.prop("href");
      $.ajax({
        dataType: 'script',
        url: commentUrl,
        method: "GET"
      });
    })
  };

  var hideComments = function(){
    $(".js-hide-comments-link").on("click", function(){
      var $this = $(this);
      var postId = $this.data("post-id");
      var postContainer = $(".js-comments-container-" + postId).parents(".js-post-container");

      $(".js-comments-container-" + postId).html("");
      $this.addClass("hidden");
      postContainer.find(".js-get-comments-link").removeClass("hidden");
      postContainer.find(".js-new-comment").addClass("hidden");
    });
  };

  getComments();
  hideComments();
})


