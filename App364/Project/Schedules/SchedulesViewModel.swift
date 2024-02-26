//
//  SchedulesViewModel.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI
import CoreData

final class SchedulesViewModel: ObservableObject {
    
    @Published var schedules: [ScheduleModel] = []
    
    @Published var isAdd: Bool = false
    
    @Published var where_from: String = ""
    @Published var where_to: String = ""
    @Published var departure_time: Date = Date()
    @Published var destination_time: Date = Date()
    
    @Published var monday: Date = Date()
    @Published var tuesday: Date = Date()
    @Published var wednesday: Date = Date()
    @Published var thursday: Date = Date()
    @Published var friday: Date = Date()
    @Published var saturday: Date = Date()
    @Published var sunday: Date = Date()
    
    func addSchedule() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "ScheduleModel", into: context) as! ScheduleModel
        
        sub.departure = where_from
        sub.destination = where_to
        
        sub.departure_time = departure_time
        sub.destination_time = destination_time
        
        sub.monday = monday
        sub.tuesday = tuesday
        sub.wednesday = wednesday
        sub.thursday = thursday
        sub.friday = friday
        sub.saturday = saturday
        sub.sunday = sunday
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchSchedules() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ScheduleModel>(entityName: "ScheduleModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.schedules = result
            
        } catch _ as NSError {
            
            self.schedules = []
        }
    }
}
