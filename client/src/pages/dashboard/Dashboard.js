import React, {Component} from 'react';
import Sidebar from "./Sidebar";
import Daterange from "../../hooks/Daterange";
import FullCalendar, { formatDate } from '@fullcalendar/react';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction';
import listPlugin from '@fullcalendar/list';
import Select2 from "../../hooks/Select2";
import SessionHelper from "../../session/SessionHelper";
import axios from "axios";

class Dashboard extends Component {

    constructor() {
        super();
        this.calendarRef = React.createRef()
        this.state = {
            weekendsVisible: true,
            currentEvents: [],
            venue_id:'',
            title:'',
            description:'',
            selectedEventInfo:[]
        }
    }


    componentDidMount() {
        this.getEventsData();
    }

    getEventsData=()=>{
        let ec = document.getElementById("event_venue_id");
        let e_venue_id = ec.value;
        axios.get('/api/events/'+e_venue_id).then(res => {
            this.setState({currentEvents:res.data.data});
        }).catch((error)=>{});

        const calendarApi = this.calendarRef.current.getApi();
        calendarApi.unselect();
    }

    handleInput = (e) =>{
        e.persist();
        this.setState({[e.target.name] : e.target.value});
    }

    handleDateSelect = (selectInfo) => {
        document.getElementById('eventAddModal').classList.add('show');
        document.getElementById("eventAddModal").style.display = "block";
        this.setState({selectedEventInfo : selectInfo});
    }

    addEvent=()=>{
        let e = document.getElementById("event_venue_id");
        let venue_id = e.value;
        const data = {
            user_id:SessionHelper.GetAuthUserId(),
            venue_id:venue_id,
            title:this.state.title,
            description:this.state.description,
            start_date:this.state.selectedEventInfo.startStr,
            end_date:this.state.selectedEventInfo.endStr,
            allDay:this.state.selectedEventInfo.allDay
        }

        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post('/api/event/store', data).then(res => {
                if (res.data.status === 200)
                {
                    let calendarApi = this.state.selectedEventInfo.view.calendar
                    calendarApi.unselect() // clear date selection
                    calendarApi.addEvent({
                        id: res.data.event.id,
                        title:res.data.event.title,
                        description:res.data.event.description,
                        status:res.data.event.status,
                        start: res.data.event.start,
                        end: res.data.event.end,
                        allDay: res.data.event.allDay
                    });

                    this.closeModal();
                }
            }).catch((error)=>{});
        });


    }

    handleEventClick = (clickInfo) => {
        console.log(clickInfo.event);
        console.log(clickInfo.event.title);
        console.log(clickInfo.event.extendedProps.description);
        console.log(clickInfo.event.extendedProps.status);
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

    closeModal = (e) =>{
        document.getElementById('eventAddModal').classList.remove('show');
        document.getElementById("eventAddModal").style.display = "none";
        document.getElementById("event_title_input").value = "";
        document.getElementById("event_description_input").value = "";
    }

    render() {
        return (
            <>
                <Daterange/>
                <Select2/>
                <section>
                    <div className="container-fluid padding-right-100px padding-left-100px padding-top-50px padding-bottom-50px">
                        <div className="row">
                            <Sidebar/>
                            <div className="col-lg-10">
                                <div>
                                    <div className="modal fade" id="eventAddModal">
                                        <div className="modal-dialog modal-dialog-centered" role="document">
                                            <div className="modal-content">
                                                <div className="modal-header">
                                                    <h5 className="modal-title" id="exampleModalLongTitle">Add</h5>
                                                    <button type="button" className="close" onClick={this.closeModal}>
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div className="modal-body">
                                                    <div className="form-group">
                                                        <label>Title</label>
                                                        <input type="text" id="event_title_input" onChange={this.handleInput} placeholder="Title" className="form-control" name="title"/>
                                                    </div>
                                                    <div className="form-group">
                                                        <label>Description</label>
                                                        <textarea onChange={this.handleInput}  id="event_description_input" placeholder="Description" className="form-control" name="description" rows="3"></textarea>
                                                    </div>
                                                </div>
                                                <div className="modal-footer">
                                                    <button type="button" className="btn btn-secondary" onClick={this.closeModal}> Close </button>
                                                    <button type="button" className="btn btn-primary" onClick={this.addEvent}>Save changes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div className="form-group mb-5">
                                    <select className="form-control select-contain-select" id="event_venue_id" name="venue_id" onChange={this.handleInput}>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                    </select>
                                </div>
                                <FullCalendar
                                    ref={this.calendarRef}
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
                                    initialEvents ={this.state.currentEvents}
                                    events={this.state.currentEvents}
                                    select={this.handleDateSelect}
                                    eventContent={this.renderEventContent} // custom render function
                                    eventClick={this.handleEventClick}
                                    // eventsSet={this.handleEvents} // called after events are initialized/added/changed/removed
                                    /* you can update a remote database when these fire:
                                    eventAdd={function(){}} //After add event
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

