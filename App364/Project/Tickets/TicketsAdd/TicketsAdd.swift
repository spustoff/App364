//
//  TicketsAdd.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI

struct TicketsAdd: View {
    
    @StateObject var viewModel: TicketsViewModel
    
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
                    
                    Text("Add Ticket")
                        .foregroundColor(Color("bg2"))
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.addTicket()
                            viewModel.fetchTickets()
                            
                            router.wrappedValue.dismiss()
                            
                            viewModel.where_from = ""
                            viewModel.where_to = ""
                            viewModel.date_time = Date()
                            viewModel.destination = Date()
                            viewModel.departure = Date()
                            viewModel.price = ""
                            viewModel.seat = ""
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("bg2"))
                                .font(.system(size: 17, weight: .semibold))
                        })
                        .opacity(viewModel.where_from.isEmpty || viewModel.where_to.isEmpty || viewModel.price.isEmpty || viewModel.seat.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.where_from.isEmpty || viewModel.where_to.isEmpty || viewModel.price.isEmpty || viewModel.seat.isEmpty ? true : false)
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
                            
                            Text("Station Departure")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            DatePicker(selection: $viewModel.departure, displayedComponents: .date, label: {})
                                .labelsHidden()
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Station Destination")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            DatePicker(selection: $viewModel.destination, displayedComponents: .date, label: {})
                                .labelsHidden()
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Date and Time")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            DatePicker(selection: $viewModel.departure, label: {})
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
                            
                            Text("Seat")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("12B")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.seat.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.seat)
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
    TicketsAdd(viewModel: TicketsViewModel())
}
