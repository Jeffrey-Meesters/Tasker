/// -------- javascript for creating tasks -------------------
$(document).on('turbolinks:load', function() {
  $("#submit").bind('click', submitTask);
});

//Taking the value from the input field
function submitTask(event) {
console.log(boardId)
console.log(cardId)

  var title = $("#new-task").val();
  var boardId = $("#boardId").data("boardid")
  var cardId = $("cardId").data("cardid")

  createTask(title, boardId, cardId);
}

  function createTask(title, boardId, cardId) {
    $.ajax({
      type: "POST",
      url:  boardId + "/cards/" + cardId + "/task",
      data: JSON.stringify({
        task: { title: title }
      }),

      contentType: "application/json",
      dataType: "json"})

      .success(function(data) {
        console.log(data)
        // create a list item
        var listItem = document.createElement("li");
        listItem.className = "draggable";

        var label = document.createElement("div");
        label.className = "draggable ui-draggable ui-draggable-handle"
        label.style.position = "relative"
        label.innerHTML = title;
        listItem.appendChild(label);
        var list = document.getElementById("tasklist");

        list.appendChild(listItem);
      })

      .fail(function(error) {
        errors = JSON.parse(error.responseText).error

        $.each(errors, function(index, value) {
          var listItem = $('<li></li>').html(value);
          $("#errors").append(listItem);
      });
    });
  }
