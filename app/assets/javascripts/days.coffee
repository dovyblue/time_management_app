jQuery ->
  $(".calendar-day").on "click", ->
    date = $(this).data("date")
    location.href = "/days/#{date}"
