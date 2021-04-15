$( document ).ready(function() {
  var getComments = function(){
    $(".js-get-comments-link").on("click", function(event){
      event.preventDefault();
      var $this = $(this);
      var commentUrl = $this.prop("href");
      $.ajax({
        url: commentUrl,
        method: "GET"
      });
    })
  }
  getComments();
})
