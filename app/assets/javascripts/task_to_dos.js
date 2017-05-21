function deleteTaskToDo(taskId) {
  console.log("works!");
  var date = window.location.pathname.split("").splice(1, 10).join("");
  var request = $.ajax({
    method: "DELETE",
    headers: {
      'X-Transaction': 'POST Example',
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    },
    url: "/task-to-dos/" + taskId,
  });
  request.done(location = "/" + date + "/task-to-dos/edit");
}
