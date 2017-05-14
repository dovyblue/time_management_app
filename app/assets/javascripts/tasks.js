document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      categories: []
    },
    mounted: function() {
      $.get("/api/v1/tasks", function(response) {
        this.categories = response;
      }.bind(this));
    }
  });
});


