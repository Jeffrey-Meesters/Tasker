unction createCard(title, boardId) {
  $.ajax({
    type: "POST",
    url: "/boards/" + boardId + "/cards.json",
    data: JSON.stringify({
      card: { title: title }
    }),

    contentType: "application/json",
    dataType: "json"})

    .success(function(data) {
      var listItem = $('<li></li>').html(data.card.title);
      $("#cards").append( listItem );  <><><><>
      $("#card-name").val(null);
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

function submitCard(event) {
  event.preventDefault();

  var title = $("#card-name").val();
  var boardId = $("#card-name").data("board-id");

  createCard(title, boardId);
}

$(document).ready(function() {
  $("form").bind('submit', submitCard);
});
```
