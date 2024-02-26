//
//  SchedulesAdd.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI

struct SchedulesAdd: View {
    
    @StateObject var viewModel: SchedulesViewModel
    
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
                    
                    Text("Add Schedule")
                        .foregroundColor(Color("bg2"))
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.addSchedule()
                            viewModel.fetchSchedules()
                            
                            router.wrappedValue.dismiss()
                            
                            viewModel.where_from = ""
                            viewModel.where_to = ""
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("bg2"))
                                .font(.system(size: 17, weight: .semibold))
                        })
                        .opacity(viewModel.where_from.isEmpty || viewModel.where_to.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.where_from.isEmpty || viewModel.where_to.isEmpty ? true : false)
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
                            
                            DatePicker(selection: $viewModel.departure_time, displayedComponents: .date, label: {})
                                .labelsHidden()
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Station Destination")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            DatePicker(selection: $viewModel.destination_time, displayedComponents: .date, label: {})
                                .labelsHidden()
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Monday")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            DatePicker(selection: $viewModel.monday, displayedComponents: .hourAndMinute, label: {})
                                .labelsHidden()
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Tuesday")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            DatePicker(selection: $viewModel.tuesday, displayedComponents: .hourAndMinute, label: {})
                                .labelsHidden()
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Wednesday")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            DatePicker(selection: $viewModel.wednesday, displayedComponents: .hourAndMinute, label: {})
                                .labelsHidden()
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Thursday")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            DatePicker(selection: $viewModel.thursday, displayedComponents: .hourAndMinute, label: {})
                                .labelsHidden()
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Friday")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            DatePicker(selection: $viewModel.friday, displayedComponents: .hourAndMinute, label: {})
                                .labelsHidden()
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Saturday")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            DatePicker(selection: $viewModel.saturday, displayedComponents: .hourAndMinute, label: {})
                                .labelsHidden()
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Sunday")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            DatePicker(selection: $viewModel.sunday, displayedComponents: .hourAndMinute, label: {})
                                .labelsHidden()
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    SchedulesAdd(viewModel: SchedulesViewModel())
}
