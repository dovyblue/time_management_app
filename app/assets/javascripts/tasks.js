document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      categories: [],
      taskName: '',
      taskDuration: '',
      taskCategory: ''
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
      }
    }
  });
});


