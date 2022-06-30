<div class="box box-default">
    <div class="box-header with-border">
        <select class="form-control">
        <option value="">Select Venue</option>
        <option value="v1">Venue 1</option>
        </select>
    </div>
    <div class="box-body">
        <div id="modal-view-event" class="modal modal-top fade">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header margin-bottom-10px">
                <h4 class="modal-title">
                  <span class="event-icon"></span
                  ><span class="event-title"></span>
                </h4>
              </div>
              <div class="modal-body">
                <div class="form-group">
                  <p class="event-startDate"></p>
                  <p class="event-endDate"></p>
                </div>
                <div class="form-group event-body"></div>
                <div class="form-group event-status"></div>
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
      document.addEventListener("DOMContentLoaded", function () {
        var calendarEl = document.getElementById("calendar");

        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: "prev,next today",
            center: "title",
            right: "dayGridMonth,timeGridWeek,timeGridDay,listMonth",
          },
          initialDate: "2022-04-09",
          navLinks: true, // can click day/week names to navigate views
          businessHours: true, // display business hours
          editable: true,
          selectable: true,
          selectMirror: true,
          select: function (arg) {
            jQuery('input[name="eStartdate"]').val(arg.startStr);
            jQuery('input[name="eEnddate"]').val(arg.startStr);
            jQuery("#modal-view-event-add").modal();
            jQuery(document.body).on("click", ".AddEvent", function (e) {
              calendar.addEvent({
                title: jQuery('input[name="eName"]').val(),
                start: jQuery('input[name="eStartdate"]').val(),
                end: jQuery('input[name="eEnddate"]').val(),
                description: jQuery('input[name="edesc"]').val(),
                status: jQuery('select[name="status"] option:selected').val(),
                allDay: arg.allDay,
              });
              jQuery("#modal-view-event-add").modal("hide");
              document.getElementById("add-event").reset();
            });
            calendar.unselect();
          },
          eventClick: function (e, jsEvent, view) {
            console.log(e);
            jQuery(".event-title").html(e.event.title);
            jQuery(".event-body").html(
              "<strong>Description: </strong>" +
                e.event.extendedProps.description
            );
            jQuery(".event-status").html(
              "<strong>Status: </strong>" + e.event.extendedProps.status
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

            jQuery("#modal-view-event").modal();
          },
          dayMaxEvents: true, // allow "more" link when too many events
          events: [
            {
              title: "Business Lunch",
              start: "2022-04-03T13:00:00",
              constraint: "businessHours",
            },
            {
              title: "Holiday",
              start: "2022-04-11",
              end: "2022-04-11",
              constraint: "availableForMeeting", // defined below
              color: "#257e4a",
              description:
                "There are plenty of ready-to-use icons, and they are awesome! But why not to use ready-to-use preloaders as well? We are all about making your life easier, here are some dope helpful tools:",
              status: "pending",
            },
            {
              title: "Weeding",
              start: "2022-04-18",
              end: "2022-04-20",
              color: "#111",
              icon: "facebook",
            },
            {
              title: "Party",
              start: "2022-04-29T13:00:00",
            },

            // areas where "Meeting" must be dropped
            {
              groupId: "availableForMeeting",
              start: "2022-04-11T10:00:00",
              end: "2022-04-11T16:00:00",
              display: "background",
            },
            // red areas where no events can be dropped
            {
              start: "2022-04-24",
              end: "2022-04-28",
              overlap: false,
              display: "background",
              color: "#ff9f89",
            },
            {
              start: "2022-04-06",
              end: "2022-04-08",
              overlap: false,
              display: "background",
              color: "#ff9f89",
            },
          ],
        });

        calendar.render();
      });
    </script>
