unction createBoard(title) {
  $.ajax({
    type: "POST",
    url: "/boards/.json",
    data: JSON.stringify({
      board: { title: title }
    }),

    contentType: "application/json",
    dataType: "json"})

    .success(function(data) {
      var listItem = $('<li></li>').html(data.board.title);
      $("#boards").append( listItem );  <><><><>
      $("#board-name").val(null);
      $("#notice").html(data.message);
    })

    .fail(function(error) {
      errors = JSON.parse(error.responseText).error

      $.each(errors, function(index, value) {
        var listItem = $('<li></li>').html(value);
        $("#errors").append(listItem);
      });
    });
}

function submitBoard(event) {
  event.preventDefault();

  var title = $("#board-name").val();

  createCard(title);
}

$(document).ready(function() {
  $("form").bind('submit', submitBoard);
});
