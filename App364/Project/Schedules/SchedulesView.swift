//
//  SchedulesView.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI

struct SchedulesView: View {
    
    @StateObject var viewModel = SchedulesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAdd = true
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("bg"))
                            .font(.system(size: 17, weight: .bold))
                            .frame(width: 30, height: 30)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    })
                }
                .padding([.horizontal, .top])
                
                Text("Schedules")
                    .foregroundColor(Color("bg2"))
                    .font(.system(size: 28, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.horizontal, .bottom])
                
                if viewModel.schedules.isEmpty {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Text("No schedules added")
                            .foregroundColor(Color("bg2"))
                            .font(.system(size: 25, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("To add a schedule click a plus icon on top")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.schedules, id: \.self) { index in
                            
                                VStack(alignment: .leading, spacing: 15, content: {
                                    
                                    Text(index.departure ?? "")
                                        .foregroundColor(Color("bg2"))
                                        .font(.system(size: 25, weight: .semibold))
                                    
                                    Text("\(index.destination ?? "") station")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text("\(index.departure ?? "") -> \(index.destination ?? "")")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .regular))
                                    
                                    Rectangle()
                                        .fill(.gray.opacity(0.3))
                                        .frame(height: 1)
                                    
                                    VStack(alignment: .leading, spacing: 3, content: {
                                        
                                        Text("Monday")
                                            .foregroundColor(Color("bg2"))
                                            .font(.system(size: 17, weight: .semibold))
                                        
                                        Text((index.monday ?? Date()).convertDate(format: "HH:mm"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                    })
                                    
                                    VStack(alignment: .leading, spacing: 3, content: {
                                        
                                        Text("Tuesday")
                                            .foregroundColor(Color("bg2"))
                                            .font(.system(size: 17, weight: .semibold))
                                        
                                        Text((index.tuesday ?? Date()).convertDate(format: "HH:mm"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                    })
                                    
                                    VStack(alignment: .leading, spacing: 3, content: {
                                        
                                        Text("Wednesday")
                                            .foregroundColor(Color("bg2"))
                                            .font(.system(size: 17, weight: .semibold))
                                        
                                        Text((index.wednesday ?? Date()).convertDate(format: "HH:mm"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                    })
                                    
                                    VStack(alignment: .leading, spacing: 3, content: {
                                        
                                        Text("Thursday")
                                            .foregroundColor(Color("bg2"))
                                            .font(.system(size: 17, weight: .semibold))
                                        
                                        Text((index.thursday ?? Date()).convertDate(format: "HH:mm"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                    })
                                    
                                    VStack(alignment: .leading, spacing: 3, content: {
                                        
                                        Text("Friday")
                                            .foregroundColor(Color("bg2"))
                                            .font(.system(size: 17, weight: .semibold))
                                        
                                        Text((index.friday ?? Date()).convertDate(format: "HH:mm"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                    })
                                    
                                    VStack(alignment: .leading, spacing: 3, content: {
                                        
                                        Text("Saturday")
                                            .foregroundColor(Color("bg2"))
                                            .font(.system(size: 17, weight: .semibold))
                                        
                                        Text((index.saturday ?? Date()).convertDate(format: "HH:mm"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                    })
                                    
                                    VStack(alignment: .leading, spacing: 3, content: {
                                        
                                        Text("Sunday")
                                            .foregroundColor(Color("bg2"))
                                            .font(.system(size: 17, weight: .semibold))
                                        
                                        Text((index.sunday ?? Date()).convertDate(format: "HH:mm"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                    })
                                })
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchSchedules()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            SchedulesAdd(viewModel: viewModel)
        })
    }
}

#Preview {
    SchedulesView()
}
