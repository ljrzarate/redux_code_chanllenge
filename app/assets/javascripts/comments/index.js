$( document ).ready(function() {
  var getComments = function(){
    $("body").on("click", ".js-get-comments-link", function(event){
      event.preventDefault();
      var postId = $(".js-post-container").data("post-id");
      var $this = $(this);
      var commentUrl = $this.prop("href");
      $.ajax({
        dataType: 'script',
        url: commentUrl,
        method: "GET",
        success: function(){
          var editor = new FroalaEditor('body > .js-new-message-content')
        }
      });
    })
  };

  var hideComments = function(){
    $("body").on("click", ".js-hide-comments-link", function(){
      var $this = $(this);
      var postId = $this.data("post-id");
      var postContainer = $(".js-comments-container-" + postId).parents(".js-post-container");

      $(".js-comments-container-" + postId).html("");
      $this.addClass("hidden");
      postContainer.find(".js-get-comments-link").removeClass("hidden");
      postContainer.find(".js-new-comment").addClass("hidden");
    });
  };

  var likePost = function(){
    $("body").on("click", ".js-like-post", function(){
      var $this = $(this);
      $.ajax({
        data: {
          authenticity_token: $('[name="csrf-token"]')[0].content,
          liked: $this.data("liked")
        },
        dataType: 'script',
        url: $this.data("url"),
        method: "PUT"
      });
    });
  };

  new FroalaEditor('.js-new-message-content', {
    toolbarButtons: [['bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript'],
                     ['fontFamily', 'fontSize']]
  })

  getComments();
  hideComments();
  likePost();
})


