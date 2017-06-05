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
    computed: {
      sortStToLg: function() {
       
        // // for (var i = 0; i < this.categories.length; i++) {
        //   // console.log(this.categories[0].tasks.length);
        //   return this.categories[0].tasks.sort(function(task1, task2) {
        //     // console.log(task1.length_time);
        //     // console.log(task2.length_time);
        //     // console.log(task1.length_time > task2.length_time);
        //     return task1.name.toLowerCase().localeCompare(task2.name.toLowerCase());
        //     // return task1.length_time > task2.length_time;
        //   });
        // // }

        // for (var i = 0; i < this.categories.length; i++) {
          return this.categories[1].tasks.sort(function(task1, task2) {
            if (task1.length_time > task2.length_time) {
              return 1;
            } else if (task2.length_time > task1.length_time) {
              return -1;
            } else {
              return 0;
            }
          });
        // }

      }
      
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
        this.taskName = input.name;
        this.taskDuration = input.length_time;
        this.taskCategory = input.category_id;
        this.taskId = input.id;
      },
      removeInfo: function() {
        this.taskName = '';
        this.taskDuration = '';
        this.taskCategory = '';
        this.taskId = '';
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
        if (iconColor.target.style.color === "red") {
          iconColor.target.style.color = "white";
          var index = this.tasksToDo.indexOf(inputTask.id);
          this.tasksToDo.splice(index, 1);
        } else {
          iconColor.target.style.color = "red";
          this.tasksToDo.push(inputTask.id);
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
        // request.done(function() {
        //   location = "/" + date + "/task-to-dos/edit";
        // });
       
      },
      deleteTask: function() {
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
      },
      changeDflt: function() {
        this.dflt = !this.dflt;
      }
      // sortStTolg: function() {
      //   for (var i = 0; i < this.categories.length; i++) {
      //     return this.categories[i].tasks.sort(function(task1, task2) {
      //       if (task1.length_time > task2.length_time) {
      //         return 1;
      //       } else if (task2.length_time > task1.length_time) {
      //         return -1;
      //       } else {
      //         return 0;
      //       }
      //     });
      //   }
      // }
    }
  });
});
