$( document ).ready(function() {
  new FroalaEditor('.js-new-post-content', {
    toolbarButtons: [['bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript'],
                     ['fontFamily', 'fontSize']]
  });
})


