$(document).ready(function() {

  $(".upvote a").on('click', function(event) {
    event.preventDefault();
    var url = $(this).attr('href');

    var ajaxRequest = $.ajax({
      url: url,
      type: 'PATCH',
      data: {amount: 1}
    });

    ajaxRequest.done(function(response) {
      $('#' + response.qs_id).text(response.votecount);
    }); //done done
  }); // click done

// ----------------------------------------

  $(".downvote a").on('click', function(event) {
    event.preventDefault();
    var url = $(this).attr('href');

    var ajaxRequest = $.ajax({
      url: url,
      type: 'PATCH',
    });

    ajaxRequest.done(function(response) {
      $('#' + response.qs_id).text(response.votecount);
    }); //done done
  }); // click done

}); //ready done


$.ajax({
  url: '/path/to/file',
  type: 'default GET (Other values: POST)',
  dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
  data: {param1: 'value1'},
})
.done(function() {
  console.log("success");
})
.fail(function() {
  console.log("error");
})
.always(function() {
  console.log("complete");
});







