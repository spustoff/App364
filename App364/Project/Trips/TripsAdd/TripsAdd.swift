//
//  TripsAdd.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI

struct TripsAdd: View {
    
    @StateObject var viewModel: TripsViewModel
    
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
                    
                    Text("Add Trip")
                        .foregroundColor(Color("bg2"))
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.addTrip()
                            viewModel.fetchTrips()
                            
                            router.wrappedValue.dismiss()
                            
                            viewModel.where_from = ""
                            viewModel.where_to = ""
                            viewModel.title = ""
                            viewModel.date = Date()
                            viewModel.price = ""
                            viewModel.note = ""
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("bg2"))
                                .font(.system(size: 17, weight: .semibold))
                        })
                        .opacity(viewModel.where_from.isEmpty || viewModel.where_to.isEmpty || viewModel.title.isEmpty || viewModel.price.isEmpty || viewModel.note.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.where_from.isEmpty || viewModel.where_to.isEmpty || viewModel.title.isEmpty || viewModel.price.isEmpty || viewModel.note.isEmpty ? true : false)
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 20) {
                        
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.where_from = viewModel.where_to
                                viewModel.where_to = viewModel.where_from
                                
                            }, label: {
                                
                                Image(systemName: "arrow.up.arrow.down")
                                    .foregroundColor(Color("bg2"))
                                    .font(.system(size: 18, weight: .semibold))
                            })
                            
                            Spacer()
                            
                            VStack(spacing: 20) {
                                
                                VStack(alignment: .leading, spacing: 6, content: {
                                    
                                    Text("Departure")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Choose where from")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                            .opacity(viewModel.where_from.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.where_from)
                                            .foregroundColor(Color("bg2"))
                                            .font(.system(size: 15, weight: .regular))
                                    })
                                })
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                                
                                VStack(alignment: .leading, spacing: 6, content: {
                                    
                                    Text("Destination")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        Text("Choose where to")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                            .opacity(viewModel.where_to.isEmpty ? 1 : 0)
                                        
                                        TextField("", text: $viewModel.where_to)
                                            .foregroundColor(Color("bg2"))
                                            .font(.system(size: 15, weight: .regular))
                                    })
                                })
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Title")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Add your trip title")
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
                            
                            Text("Price")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("$100")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.price.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.price)
                                    .foregroundColor(Color("bg2"))
                                    .font(.system(size: 15, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Notes")
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
    TripsAdd(viewModel: TripsViewModel())
}
