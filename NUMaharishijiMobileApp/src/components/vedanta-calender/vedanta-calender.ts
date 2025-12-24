import { Component } from '@angular/core';
import { Api } from '../../providers';
import { Storage } from '@ionic/storage'
import { IonicModule } from "@ionic/angular";
import { NgCalendarModule } from 'ionic2-calendar';
import { CalendarMode } from 'ionic2-calendar';

@Component({
  selector: 'vedanta-calender',
  templateUrl: 'vedanta-calender.html',
  imports: [IonicModule,NgCalendarModule]
})
export class VedantaCalenderComponent {

  eventSource: any;
  viewTitle: any;
  isToday:any= 0;
  calendar = {
    mode: 'month' as CalendarMode,
    currentDate: new Date(),
    dateFormatter : {
  formatMonthViewDay: (date: Date) => date.getDate().toString(), // 1,2,3...
  formatMonthViewDayHeader: (date: Date) =>
    date.toLocaleDateString('en-US', { weekday: 'short' }), // Sun, Mon, Tue...
  formatMonthViewTitle: (date: Date) =>
    date.toLocaleDateString('en-US', { month: 'long', year: 'numeric' }), // September 2025
  formatWeekViewDayHeader: (date: Date) =>
    date.toLocaleDateString('en-US', { weekday: 'short' }), // Mon, Tue...
  formatWeekViewTitle: (date: Date) =>
    `Week of ${date.toLocaleDateString('en-US', { month: 'short', day: 'numeric' })}`,
  formatWeekViewHourColumn: (date: Date) =>
    date.getHours().toString().padStart(2, '0') + ':00', // 09:00, 10:00
  formatDayViewHourColumn: (date: Date) =>
    date.getHours().toString().padStart(2, '0') + ':00',
  formatDayViewTitle: (date: Date) =>
    date.toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric', year: 'numeric' })
}
  }  

  onViewTitleChanged(title: any) {
    this.viewTitle = title;
  }

  onEventSelected(event: any) {
     
       // console.log('Event selected:' + event.startTime + '-' + event.endTime + ',' + event.title);
  }

  changeMode(mode: any) {
    this.calendar.mode = mode;
  }

  today() {
    this.calendar.currentDate = new Date();
  }

  onTimeSelected(ev: any) {
   //console.log('Selected time: ' + ev.selectedTime + ', hasEvents: ' +
   //   (ev.events !== undefined && ev.events.length !== 0) + ', disabled: ' + ev.disabled);
  }

  onCurrentDateChanged(event: Date) {
    var today = new Date();
    today.setHours(0, 0, 0, 0);
    event.setHours(0, 0, 0, 0);
    this.isToday = today.getTime() === event.getTime();
  }

  onRangeChanged(ev: any) {
    //console.log('range changed: startTime: ' + ev.startTime + ', endTime: ' + ev.endTime);
  }

  // markDisabled = (date: Date) => {
  //   var current = new Date();
  //   current.setHours(0, 0, 0);
  //   return date < current;
  // };
  markDisabled = (date: Date) => {
  const current = this.calendar.currentDate;
  const monthStart = new Date(current.getFullYear(), current.getMonth(), 1);
  const monthEnd = new Date(current.getFullYear(), current.getMonth() + 1, 0);

  return date < monthStart || date > monthEnd;
};


  studentID: any;
  calendarOptions: any;
  displayEvent: any;
  data :any= [];
  // @ViewChild(CalendarComponent) ucCalendar: CalendarComponent;
  attendancedata: any;
  constructor(private api: Api, private storage: Storage) { }

  ngOnInit() {
    let k: any;
    this.storage.get('Useraccount').then((Useraccountdata) => {
      this.studentID = Useraccountdata.StudentID;
      this.api.get('AttendanceSelectAllByStudentID',
        { studentID: this.studentID, tenantID: this.api.getTenantID(), secureCode: '1' })
        .subscribe((AttendanceData: any) => {
         // console.log(AttendanceData);
          this.attendancedata = AttendanceData.Result[0];
          for (k in this.attendancedata) {
            var tech = this.attendancedata[k];
            var date = new Date(parseInt(tech.Date.replace("/Date(", "").replace(")/")));
            // new Date(parseInt(tech.Date.substr(6,13)));
          // console.log(date);
            this.data.push({
              title:  'Period:'+ tech.PeriodNumber +',' + tech.AttendanceStatus + ' \n By ' + tech.UpdatedByUser,
              startTime: date,
              endTime: date,
              allDay: false,
              
              // date.toISOString().substring(0, 10) });
            });
          }
          this.eventSource = this.data;
        },
          error => console.log(error));
    });
  }
  clickButton(model: any) {
    this.displayEvent = model;
  }

  eventClick(model: any) {
    model = {
      event: {
        id: model.event.id,
        start: model.event.start,
        end: model.event.end,
        title: model.event.title,
        allDay: model.event.allDay
        // other params
      },
      duration: {}
    }
    this.displayEvent = model;
  }
  updateEvent(model: any) {
    model = {
      event: {
        id: model.event.id,
        start: model.event.start,
        end: model.event.end,
        title: model.event.title
        // other params
      },
      duration: {
        _data: model.duration._data
      }
    }
    this.displayEvent = model;
  }


}
