document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      categories: [],
      taskName: '',
      taskDuration: '',
      taskCategory: '',
      taskId: '',
      dflt: true,
      tasksToDo: [],
      date: ''
    },
    mounted: function() {
      var parameters =  {
        userId: window.id
      };
      $.get("/api/v1/tasks",parameters, function(response) {
        this.categories = response;
      }.bind(this));
    },
    methods: {
      addTask: function() {
        var params = {
          name: this.taskName,
          lengthTime: this.taskDuration,
          categoryId: this.taskCategory,
          userId: window.id
        };
        $.post("/api/v1/tasks", params, function(response) {
          this.categories = response;
        }.bind(this));
        this.taskName = '';
        this.taskDuration = '';
        this.taskCategory = '';
        this.taskId = '';
      },
      showInfo: function(input) {
        // console.log(input);
        this.taskName = input.name;
        this.taskDuration = input.length_time;
        this.taskCategory = input.category_id;
        this.taskId = input.id;
      },
      updateTask: function() {
        var params = {
          id: this.taskId,
          name: this.taskName,
          lengthTime: this.taskDuration,
          categoryId: this.taskCategory,
          userId: window.id
        };
        var request = $.ajax({
          method: "PATCH",
          url: "/api/v1/tasks/" + this.taskId,
          data: params
        });
        request.done( function(response) {
          this.categories = response;
        }.bind(this));
        this.taskName = '';
        this.taskDuration = '';
        this.taskCategory = '';
        this.taskId = '';
      },
      addToList: function(inputTask, iconColor) {
        // console.log(inputTask);
        if (iconColor.target.style.color === "red") {
          iconColor.target.style.color = "white";
          var index = this.tasksToDo.indexOf(inputTask.id);
          // console.log(index);
          this.tasksToDo.splice(index, 1);
          // console.log(this.tasksToDo);
        } else {
          iconColor.target.style.color = "red";
          this.tasksToDo.push(inputTask.id);
          // console.log(this.tasksToDo);
        }
      },
      submitTasks: function() {
        var date = window.location.pathname.split("").splice(1, 10).join("");
        var request = $.ajax({
          method: "POST",
          headers: {
            'X-Transaction': 'POST Example',
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
          },
          url: "/task-to-dos",
          data: {
            tasks: this.tasksToDo,
            date: date
          }
        });
        request.done(location = "/" + date + "/task-to-dos/edit");
      },
      deleteTask: function() {
        // console.log(this.taskId);
        var request = $.ajax({
          method: "DELETE",
          url: "/api/v1/tasks/" + this.taskId,
          data: {userId: window.id}
        });
        request.done( function(response) {
          this.categories = response;
        }.bind(this));
        this.taskName = '';
        this.taskDuration = '';
        this.taskCategory = '';
        this.taskId = '';
      }
    }
  });
});


