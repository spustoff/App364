//
//  TripsViewModel.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI
import CoreData

final class TripsViewModel: ObservableObject {
    
    @Published var trips: [TripModel] = []
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var selectedTrip: TripModel? = nil
    
    @Published var where_from: String = ""
    @Published var where_to: String = ""
    @Published var title: String = ""
    @Published var date: Date = Date()
    @Published var price: String = ""
    @Published var note: String = ""
    
    func addTrip() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "TripModel", into: context) as! TripModel
        
        sub.where_from = where_from
        sub.where_to = where_to
        sub.title = title
        sub.date = date
        sub.price = Int16(price) ?? 0
        sub.note = note
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchTrips() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TripModel>(entityName: "TripModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.trips = result
            
        } catch _ as NSError {
            
            self.trips = []
        }
    }
}

