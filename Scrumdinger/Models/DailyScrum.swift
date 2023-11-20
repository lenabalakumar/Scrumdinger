//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Lenabalakumar Subbarayan on 15/07/2023.
//

import Foundation

struct DailyScrum: Identifiable {
    var id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map{ Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] = [
        DailyScrum(title: "Design", attendees: ["Cathy", "McAlister", "Brown", "Nicole"], lengthInMinutes: 10, theme: .bubblegum),
        DailyScrum(title: "Mockup", attendees: ["Myra", "Sandy", "Robert", "Oswald"], lengthInMinutes: 30, theme: .teal)
    ]
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}
