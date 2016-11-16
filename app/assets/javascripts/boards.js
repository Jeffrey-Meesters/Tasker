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
      var listItem = $('<li></li>').html(data.board.title);
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

// ######----- create and submit cards -------########
function createCard(title, boardId) {
  $.ajax({
    type: "POST",
    url: "/boards/" + boardId + "/cards.json",
    data: JSON.stringify({
      card: { title: title }
    }),

    contentType: "application/json",
    dataType: "jsonp"
  })

    .success(function(data) {
      var listItem = $('<li></li>').html(data.card.title);
      $("#cards").append( listItem );
      $("#card-name").val(null);
      $("#notice").html(data.message);
    })

    .fail(function(error) {
      errors = JSON.parse(error.responseText).error

      $.each(errors, function(index, value) {
        var listItem = $('<li></li>').html(value);
        $("#errors").append(listItem);
        console.log(error)
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
  $(".cardform").bind('submit', submitCard);
});

// -------- javascript for creating tasks -------------------
//Taking the value from the input field
function submitTask() {
    var inputField = document.getElementById("new-task");
    var newTaskTitle = inputField.value;
    createTask(newTaskTitle);

    //building the task

    function createTask(title) {
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
    }

    function nextTaskId() {
        return document.getElementsByClassName("task").length + 1;
    }

    function nexttaskInputField() {
        return document.getElementsByClassName("new-task").length + 1;
    }

  inputField.value = null;
}
