<div class="box box-default">
    <div class="box-header with-border">
        <select class="form-control" id="venue_select">
            <option value="">Select Venue</option>
            @foreach(App\Models\Venue::options() as $id => $name)
                <option value="{{$id}}">{{$name}}</option>
            @endforeach
        </select>
    </div>
    <div class="box-body">
        <div id="modal-view-event" class="modal modal-top fade">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header margin-bottom-10px">
                <h4 class="modal-title">
                  Show
                </h4>
              </div>
              <div class="modal-body">
                <div class="form-group">
                  <p class="event-startDate"></p>
                  <p class="event-endDate"></p>
                </div>
                <div class="form-group event-title"></div>
                <div class="form-group event-body"></div>
                <div class="form-group">
                  <div class="row">
                    <label class="col-sm-1 control-label" style="padding-top: 6px;">Status:</label>
                    <div class="col-sm-11" id="eventStatusOptions">
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button
                  type="button"
                  class="btn btn-primary"
                  data-dismiss="modal"
                >
                  Close
                </button>
              </div>
            </div>
          </div>
        </div>
        <!--#modal-view-event-->

        <div id="modal-view-event-add" class="modal modal-top fade calendar-modal">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <form id="add-event">
                <div class="modal-body">
                  <h4>Add Event Detail</h4>
                  <div class="form-group">
                    <label>Event name</label>
                    <input type="text" class="form-control" name="eName" />
                  </div>
                  <div class="form-group">
                    <label>Event Start Date</label>
                    <input
                      type="date"
                      class="form-control"
                      name="eStartdate"
                    />
                  </div>
                  <div class="form-group">
                    <label>Event End Date</label>
                    <input
                      type="date"
                      class="form-control"
                      name="eEnddate"
                    />
                  </div>
                  <div class="form-group">
                    <label>Event Description</label>
                    <textarea class="form-control" name="edesc"></textarea>
                  </div>
                  <div class="form-group">
                    <label>Event Status</label>
                    <select name="status" class="form-control">
                      <option value="">Select Status</option>
                      <option value="approved">Approved</option>
                      <option value="pending">Pending</option>
                      <option value="reject">Reject</option>
                      <option value="complete">Complete</option>
                    </select>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn AddEvent btn-primary">
                    Save
                  </button>
                  <button
                    type="button"
                    class="btn btn-primary"
                    data-dismiss="modal"
                  >
                    Close
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!--#modal-view-event-add-->
        <div id="calendar"></div>
    </div>
</div>
 <link rel="stylesheet" href="/vendor/laravel-admin/fullCalendar/main.min.css" />
<script src="/vendor/laravel-admin/fullCalendar/main.min.js"></script>
<script type="text/javascript">
  $(document.body).on('change', '#venue_select', function(){
    calendar(this.value);
  });

  $(document.body).on('change', '#event_status', function(){
    var venue_id = $('#venue_select :selected').val();
    var event_id = $(this).attr('selectedeventid');
    var status = this.value;
    $('#calendar').css({'display':'block'});
      $.ajax({
      url: "{{route('admin.calendar.event.update', '')}}/"+event_id,
      type: 'POST',
      data: {_token:"{{ csrf_token() }}", status:status},
      success: function(res) {
        calendar(venue_id);
        $('#modal-view-event').modal('toggle');
      }
    });
  });
</script>
<script type="text/javascript">
  function calendar(venue_id){
    var calendarEl = document.getElementById("calendar");
    if(venue_id == ''){$('#calendar').css({'display':'none'});}
    if(venue_id != '')
    {
      $('#calendar').css({'display':'block'});
        $.ajax({
          url: "{{route('admin.calendar.events', '')}}/"+venue_id,
          type: 'GET',
          data: {_token:"{{ csrf_token() }}"},
          success: function(res) {
            var events = res.data;
            var calendar = new FullCalendar.Calendar(calendarEl, {
              headerToolbar: {
                left: "prev,next today",
                center: "title",
                right: "dayGridMonth,timeGridWeek,timeGridDay,listMonth",
              },
              initialDate: "{{date('Y-m-d')}}",
              navLinks: true, // can click day/week names to navigate views
              businessHours: true, // display business hours
              editable: true,
              selectable: true,
              selectMirror: true,
              select: function (arg) {
                // jQuery('input[name="eStartdate"]').val(arg.startStr);
                // jQuery('input[name="eEnddate"]').val(arg.startStr);
                // jQuery("#modal-view-event-add").modal();
                // jQuery(document.body).on("click", ".AddEvent", function (e) {
                //   calendar.addEvent({
                //     title: jQuery('input[name="eName"]').val(),
                //     start: jQuery('input[name="eStartdate"]').val(),
                //     end: jQuery('input[name="eEnddate"]').val(),
                //     description: jQuery('input[name="edesc"]').val(),
                //     status: jQuery('select[name="status"] option:selected').val(),
                //     allDay: arg.allDay,
                //   });
                //   jQuery("#modal-view-event-add").modal("hide");
                //   document.getElementById("add-event").reset();
                // });
                // calendar.unselect();
              },
              eventClick: function (e, jsEvent, view) {
                //console.log(e);
                jQuery(".event-title").html(
                  "<strong>Title: </strong>" +
                  e.event.title
                );

                if (e.event.endStr != "") {
                  jQuery(".event-startDate").html(
                    "<strong>Start Date: </strong>" + e.event.startStr
                  );
                  jQuery(".event-endDate").html(
                    "<strong>End Date: </strong>" + e.event.endStr
                  );
                } else {
                  jQuery(".event-startDate").html(
                    "<strong>Date: </strong>" + e.event.startStr
                  );
                }
                jQuery(".event-body").html(
                  "<strong>Description: </strong>" +
                    e.event.extendedProps.description
                );

                var statusSelect = '<select selectedEventId="'+e.event.id+'" name="status" id="event_status" class="form-control"><option value="">--Select Status--</option><option value="pending" '+(e.event.extendedProps.status == "pending" ? 'selected' : '')+'>Pending</option><option value="approved" '+(e.event.extendedProps.status == "approved" ? 'selected' : '')+'>Approved</option><option value="rejected" '+(e.event.extendedProps.status == "rejected" ? 'selected' : '')+'>Reject</option><option value="completed" '+(e.event.extendedProps.status == "completed" ? 'selected' : '')+'>Complete</option></select>';
                $('#eventStatusOptions').html(statusSelect);
                jQuery("#modal-view-event").modal();
              },
              dayMaxEvents: true, // allow "more" link when too many events
              events: events,
            });
            calendar.render();
        }
      });
    }
  }
</script>
