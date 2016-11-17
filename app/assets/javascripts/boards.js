// ########--------Create and submit Boards--------########
function createBoard(title) {
  $.ajax({
    type: "POST",
    url: "/boards.json",
    data: JSON.stringify({
      board: { title: title }
    }),

    contentType: "application/json",
    dataType: "json"})

    .success(function(data) {
      linkTitle = $('<a></a>').attr('href', '/boards/' + data.board.id).html(data.board.title);
      var listItem = $('<li></li>').append(linkTitle);
      $("#boards").append( listItem );
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

  createBoard(title);
}

$(document).ready(function() {
  $(".boardform").bind('submit', submitBoard);
});

// -------- creating tasks -------------------

//Taking the value from the input field
function submitTask(event) {
  even.preventDefault();

  var inputField = document.getElementById("new-task");
  var newTaskTitle = inputField.value;

  createTask(newTaskTitle);
}

  function createTask(title) {
    $.ajax({
      type: "POST"
      url: "/boards" + boardId + "/cards/" + cardId.json
      data: JSON.stringify({
        task: {title: title}
      })

      contentType: "application/json",
      dataType: "json"

      .succes(function(data){
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
  });
  }

}
