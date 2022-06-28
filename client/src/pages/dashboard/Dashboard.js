import React, {Component} from 'react';
import Sidebar from "./Sidebar";
import Daterange from "../../hooks/Daterange";

import FullCalendar, { formatDate } from '@fullcalendar/react';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction';
import listPlugin from '@fullcalendar/list';

class Dashboard extends Component {
    state = {
        weekendsVisible: true,
        currentEvents: []
    }

    handleDateSelect = (selectInfo) => {
        let title = prompt('Please enter a new title for your event');
        let calendarApi = selectInfo.view.calendar

        calendarApi.unselect() // clear date selection

        if (title) {
            calendarApi.addEvent({
                id: 1,
                title,
                start: selectInfo.startStr,
                end: selectInfo.endStr,
                allDay: selectInfo.allDay
            })
        }
    }

    handleEventClick = (clickInfo) => {
        if (window.confirm(`Are you sure you want to delete the event '${clickInfo.event.title}'`)) {
            clickInfo.event.remove()
        }
    }

    renderEventContent = (eventInfo) => {
        return (
            <>
                <b>{eventInfo.timeText}</b>
                <i>{eventInfo.event.title}</i>
            </>
        )
    }


    render() {
        return (
            <>
                <Daterange/>
                <section>
                    <div className="container-fluid padding-right-100px padding-left-100px padding-top-50px padding-bottom-50px">
                        <div className="row">
                            <Sidebar/>
                            <div className="col-lg-10">
                                <FullCalendar
                                    plugins={[dayGridPlugin, timeGridPlugin, interactionPlugin, listPlugin]}
                                    headerToolbar={{
                                        left: 'prev,next today',
                                        center: 'title',
                                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                                    }}
                                    initialView='dayGridMonth'
                                    editable={true}
                                    selectable={true}
                                    selectMirror={true}
                                    dayMaxEvents={true}
                                    weekends={this.state.weekendsVisible}
                                    initialEvents={[
                                        {
                                            id: 1,
                                            title: 'All-day event',
                                            start: new Date().toISOString().replace(/T.*$/, '')
                                        },
                                        {
                                            id: 2,
                                            title: 'Timed event',
                                            start: new Date().toISOString().replace(/T.*$/, '')
                                        }
                                    ]}
                                    select={this.handleDateSelect}
                                    eventContent={this.renderEventContent} // custom render function
                                    eventClick={this.handleEventClick}
                                    // eventsSet={this.handleEvents} // called after events are initialized/added/changed/removed
                                    /* you can update a remote database when these fire:
                                    eventAdd={function(){}}
                                    eventChange={function(){}}
                                    eventRemove={function(){}}
                                    */
                                />
                            </div>
                        </div>
                    </div>
                </section>

            </>
        );
    }
}

export default Dashboard;

