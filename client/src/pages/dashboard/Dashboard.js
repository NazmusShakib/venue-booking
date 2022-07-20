import React, {Component} from 'react';
import Sidebar from "./Sidebar";
import FullCalendar, { formatDate } from '@fullcalendar/react';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction';
import listPlugin from '@fullcalendar/list';
import SessionHelper from "../../session/SessionHelper";
import axios from "axios";
import Select from 'react-select';
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
            selectedEventDateInfo:[],
            selectedEventInfo:[],
            venueLists:[],
            loadCalendar:'',
        }
    }


    componentDidMount() {
        let data = {
            user_id:SessionHelper.GetAuthUserId(),
        };
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post('/api/venues/lists/for/dropdown', data).then(res => {
                this.setState({venueLists:res.data.venues});
            }).catch((error)=>{});
        });
    }

    handleEventSelect = (selectedOption) =>{
        this.setState({loadCalendar:selectedOption.value});
        this.setState({venue_id : selectedOption.value});
        this.getEventsData(selectedOption.value);
    }

    handleInput = (e) =>{
        e.persist();
        this.setState({[e.target.name] : e.target.value});
    }

    getEventsData=(venue_id='')=>{
        let venueId = venue_id !== '' ? venue_id : this.state.venue_id;
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.get('/api/events/'+venueId).then(res => {
                const calendarApi = this.calendarRef.current.getApi();
                calendarApi.unselect();
                this.setState({currentEvents:res.data.data});
            }).catch((error)=>{});
        });
    }

    handleDateSelect = (selectInfo) => {
        document.getElementById('eventAddModal').classList.add('show');
        document.getElementById("eventAddModal").style.display = "block";
        this.setState({selectedEventDateInfo : selectInfo});
    }

    addEvent=()=>{
        const data = {
            user_id:SessionHelper.GetAuthUserId(),
            venue_id:this.state.venue_id,
            title:this.state.title,
            description:this.state.description,
            start_date:this.state.selectedEventDateInfo.startStr,
            end_date:this.state.selectedEventDateInfo.endStr,
            allDay:this.state.selectedEventDateInfo.allDay,
            status:'pending'
        }

        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post('/api/event/store', data).then(res => {
                console.log(res.data);
                if (res.data.status === 200)
                {
                    this.getEventsData();
                    this.closeAddModal();
                }
            }).catch((error)=>{});
        });
    }

    handleEventClick = (clickInfo) => {
        document.getElementById('eventViewModal').classList.add('show');
        document.getElementById("eventViewModal").style.display = "block";
        document.getElementById("eventTitle").innerText = clickInfo.event.title;
        document.getElementById("eventDescription").innerText = clickInfo.event.extendedProps.description;
        document.getElementById("eventStatus").innerText = clickInfo.event.extendedProps.status;
        document.getElementById("eventStart").innerText = clickInfo.event.startStr;
        document.getElementById("eventEnd").innerText = clickInfo.event.endStr;
        this.setState({selectedEventInfo:clickInfo});
    }

    deleteEvent = () => {
        let event = this.state.selectedEventInfo;
        if (window.confirm(`Are you sure you want to delete the event '${event.event.title}'`)) {
            axios.get('/sanctum/csrf-cookie').then(response => {
                axios.get('/api/delete/event/'+event.event.id).then(res => {
                    if (res.data.status === 200)
                    {
                        this.closeViewModal();
                        event.event.remove();
                    }
                }).catch((error)=>{});
            });
        }
    }

    renderEventContent = (eventInfo) => {
        return (
            <>
                <i>{eventInfo.event.title}</i>
            </>
        )
    }

    closeAddModal = (e) =>{
        document.getElementById('eventAddModal').classList.remove('show');
        document.getElementById("eventAddModal").style.display = "none";
        document.getElementById("event_title_input").value = "";
        document.getElementById("event_description_input").value = "";
    }

    closeViewModal = (e) =>{
        document.getElementById('eventViewModal').classList.remove('show');
        document.getElementById("eventViewModal").style.display = "none";
    }

    render() {
        return (
            <>
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
                                                    <button type="button" className="close" onClick={this.closeAddModal}>
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
                                                    <button type="button" className="btn btn-secondary" onClick={this.closeAddModal}> Close </button>
                                                    <button type="button" className="btn btn-primary" onClick={this.addEvent}>Save changes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="modal fade" id="eventViewModal">
                                        <div className="modal-dialog modal-dialog-centered" role="document">
                                            <div className="modal-content">
                                                <div className="modal-header">
                                                    <h5 className="modal-title" id="exampleModalLongTitle">Show</h5>
                                                    <button type="button" className="close" onClick={this.closeViewModal}>
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div className="modal-body">
                                                    <div className="form-group">
                                                        <p><strong>Title: </strong> <span id="eventTitle"></span></p>
                                                    </div>
                                                    <div className="form-group">
                                                        <p><strong>Description: </strong> <span id="eventDescription"></span></p>
                                                    </div>
                                                    <div className="form-group">
                                                        <p><strong>Start Date: </strong> <span id="eventStart"></span></p>
                                                    </div>
                                                    <div className="form-group">
                                                        <p><strong>End Date: </strong> <span id="eventEnd"></span></p>
                                                    </div>
                                                    <div className="form-group">
                                                        <p><strong>Status: </strong> <span id="eventStatus"></span></p>
                                                    </div>
                                                </div>
                                                <div className="modal-footer">
                                                    <button type="button" className="btn btn-secondary" onClick={this.closeViewModal}> Close </button>
                                                    <button type="button" onClick={this.deleteEvent} className="btn btn-danger">Delete</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div className="form-group mb-5">
                                    <Select
                                        name="venue_id"
                                        options={this.state.venueLists}
                                        onChange={this.handleEventSelect}
                                    />
                                </div>
                                {this.state.loadCalendar !== '' &&
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
                                        initialEvents={this.state.currentEvents}
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
                                }
                            </div>
                        </div>
                    </div>
                </section>
            </>
        );
    }
}

export default Dashboard;

