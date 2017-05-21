$(document).ready(function() {
  var clock = $('clock');
  var start = $('.start');
  var stop = $('.stop');
  var reset = $('.reset');
  var hiddenTimer = $('#hidden_timer');
  var mil = 0, sec = 0, min = 0, hrs = 0, t;

  function add() {
    mil++;
    if (mil >= 100) {
      mil = 0;
      sec++;
      if (sec >= 60) {
        sec = 0;
        min++;
        if (min >= 60) {
          min = 0;
          hrs++;
        }
      }
    }
    function makeTimerString() {
      return (hrs ? (hrs > 9 ? hrs : "0" + hrs) : "00") + ":" + (min ? (min > 9 ? min : "0" + min) : "00") + ":" + (sec ? (sec > 9 ? sec : "0" + sec) : "00");
    }
    function hiddenTimerString() {
      return (min ? (min > 9 ? min : "0" + min) : "00");
    }
    clock.html(makeTimerString);
    // hiddenTimer.value(makeTimerString);
    hiddenTimer[0].value = hiddenTimerString();
    clockStart();
  }

  function clockStart() {
    t = setTimeout(add, 10);
    start[0].style['display'] = 'none';
    stop[0].style['display'] = 'inline';
  }

  function resetClock() {
    clock.html("00:00:00");
    mil = 0;
    sec = 0;
    min = 0;
    hrs = 0;
  }

  function stopClock() {
    clearTimeout(t);
    start[0].style['display'] = 'inline';
    stop[0].style['display'] = 'none';
  }

  start.click(clockStart);
  stop.click(stopClock);
  reset.click(resetClock);

});
function hideTask(input) {
  var wholeDiv = input.parentElement.parentElement.parentElement.parentElement.parentElement;
  wholeDiv.classList.add('hidden');
  var title = input.parentElement.parentElement.children[0].children[0];
  title.classList.add('complete');
}
function showAll() {
  var hidden = document.querySelectorAll('.hidden');
  for (var i = 0; i < hidden.length; i++) {
    hidden[i].classList.remove('hidden');
  }
}