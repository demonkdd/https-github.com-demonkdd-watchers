//
//  SetSchedule.swift
//  watchers Watch App
//
//  Created by Cameron Slaughter on 3/31/25.
//

import SwiftUI
import EventKit

struct Event: Identifiable {
    let id: UUID = UUID()
    let title: String
    let date: Date
    let description: String
}

struct SetSchedule: View {
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    let events: [Event] = []
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd LLL YYYY"
        return formatter
    }()
    
    var body: some View {
        Text("Set Schedule")
            .bold()
            .padding(.top, -21.0)
            .padding()
        NavigationStack {
            VStack {
                Button { requestCalendarAcess(events.first!)} label: { Text("Add Event") }
                List {
                    ForEach(events) { event in
                        Button {
                            requestCalendarAcess(event)
                        } label: {
                            HStack {
                                Text("\(formatter.string(from: event.date))")
                                Text(event.title)
                                    .font(.headline)
                            }
                        }
                        
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage))
                }
            }
        }
    }
    
    private func requestCalendarAcess( _ event: Event) {
        let eventStore = EKEventStore()
        
        eventStore.requestFullAccessToEvents { (granted, error) in
            if granted && error == nil {
                let calendarEvent = EKEvent(eventStore: eventStore)
                calendarEvent.title = event.title
                calendarEvent.startDate = event.date
                calendarEvent.endDate = event.date
                calendarEvent.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    //try eventStore.save(calendarEvent, span: .thisEvent)
                    alertTitle = "Event Added"
                    alertMessage = "Added Event"
                    showAlert = true
                } catch {
                    alertTitle = "Error"
                    alertMessage = "There was an error adding the event to your calendar."
                    showAlert = true
                }
            } else {
                alertTitle = "Error"
                alertMessage = "Acess to the calendar waws denied."
                showAlert = true
            }
        }
    }
}

#Preview {
    SetSchedule()
}
