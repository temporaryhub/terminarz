# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#calendar').fullCalendar({
      timeFormat: 'H:mm',
      eventClick: `function(calEvent, jsEvent, view) {

        alert(calEvent.desc);

    }`
  });
  `for (i = 0; i < schedules.length; i++) {
    schedule = schedules[i];
    t = schedule.descirption;
    if (t.length > 150)
    {
        t = t.substr(0,100)+" (...)";
    }
    $('#calendar').fullCalendar('renderEvent', {'desc' : schedule.descirption, 'title' : t, 'start' : new Date(schedule.start_date), 'end' : new Date(schedule.end_date), editable: false, allDay : false})
  }`

  for schedule in schedules
    s = schedule
  	
