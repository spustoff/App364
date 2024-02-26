//
//  NotesAdd.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI

struct NotesAdd: View {
    
    @StateObject var viewModel: NotesViewModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.4))
                    .frame(width: 50, height: 5)
                    .padding(.top, 5)
                
                ZStack {
                    
                    Text("Add Note")
                        .foregroundColor(Color("bg2"))
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.addNote()
                            viewModel.fetchNotes()
                            
                            router.wrappedValue.dismiss()
                            
                            viewModel.title = ""
                            viewModel.note = ""
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("bg2"))
                                .font(.system(size: 17, weight: .semibold))
                        })
                        .opacity(viewModel.title.isEmpty || viewModel.note.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.title.isEmpty || viewModel.note.isEmpty ? true : false)
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 20) {
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Title")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Add your note title")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.title.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.title)
                                    .foregroundColor(Color("bg2"))
                                    .font(.system(size: 15, weight: .regular))
                            })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            DatePicker(selection: $viewModel.date, displayedComponents: .date, label: {})
                                .labelsHidden()
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Note")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Add notes here")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.note.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.note)
                                    .foregroundColor(Color("bg2"))
                                    .font(.system(size: 15, weight: .regular))
                            })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    NotesAdd(viewModel: NotesViewModel())
}
