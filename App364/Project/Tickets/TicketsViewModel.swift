//
//  TicketsViewModel.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI
import CoreData

final class TicketsViewModel: ObservableObject {
    
    @Published var tickets: [TicketModel] = []
    
    @Published var isChart: Bool = false
    @Published var isAdd: Bool = false
    
    @Published var where_from: String = ""
    @Published var where_to: String = ""
    @Published var departure: Date = Date()
    @Published var destination: Date = Date()
    @Published var date_time: Date = Date()
    @Published var price: String = ""
    @Published var seat: String = ""
    
    func addTicket() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "TicketModel", into: context) as! TicketModel
        
        sub.where_from = where_from
        sub.where_to = where_to
        sub.departure = departure
        sub.destination = destination
        sub.date_time = date_time
        sub.price = Int16(price) ?? 0
        sub.seat = seat
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchTickets() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TicketModel>(entityName: "TicketModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.tickets = result
            
        } catch _ as NSError {
            
            self.tickets = []
        }
    }
}
