//
//  NotesViewModel.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI
import CoreData

final class NotesViewModel: ObservableObject {
    
    @Published var notes: [NoteModel] = []
    
    @Published var isChart: Bool = false
    @Published var isAdd: Bool = false
    
    @Published var title: String = ""
    @Published var date: Date = Date()
    @Published var note: String = ""
    
    @Published var selectedNote: NoteModel? = nil
    @Published var isDetail: Bool = false
    
    func addNote() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "NoteModel", into: context) as! NoteModel
        
        sub.title = title
        sub.date = date
        sub.note = note
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchNotes() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NoteModel>(entityName: "NoteModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.notes = result
            
        } catch _ as NSError {
            
            self.notes = []
        }
    }
}
