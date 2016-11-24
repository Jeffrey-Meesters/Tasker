function createCard(title, boardId) {
  $.ajax({
    type: "POST",
    url: "/boards/" + boardId + "/cards.json",
    data: JSON.stringify({
      card: { title: title }
    }),

    contentType: "application/json",
    dataType: "json"})

    .success(function(data) {
      buttonText = $("<button></button>").text("task")
        buttonTextMouse = (buttonText).attr('onMouseDown', "submitTask()")

      inputFieldType = $('<input >').attr('type',"text")
        inputFieldId= (inputFieldType).attr('id', "new-task" )

      itemTitle = $('<h3></h3>').html(data.card.title);
      var listItemTitle = $('<li></li>').append(itemTitle).append(inputFieldType).append(buttonText);

      $("#cards").append( listItemTitle );
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

$(document).on('turbolinks:load', function() {
  $(".cardform").bind('submit', submitCard);
});
