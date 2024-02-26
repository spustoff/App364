//
//  TicketsView.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI

struct TicketsView: View {
    
    @StateObject var viewModel = TicketsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isChart = true
                        
                    }, label: {
                        
                        Image("eurusd")
                    })
                    
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
                
                Text("Tickets")
                    .foregroundColor(Color("bg2"))
                    .font(.system(size: 28, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.horizontal, .bottom])
                
                if viewModel.tickets.isEmpty {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Text("No tickets added")
                            .foregroundColor(Color("bg2"))
                            .font(.system(size: 25, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("To add a ticket click a plus icon on top")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.tickets, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 20, content: {
                                    
                                    HStack(content: {
                                        
                                        VStack(alignment: .leading, spacing: 4, content: {
                                            
                                            Text((index.date_time ?? Date()).convertDate(format: "HH:mm"))
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                            
                                            Text((index.date_time ?? Date()).convertDate(format: "MMM d"))
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                        })
                                        
                                        Spacer()
                                        
                                        Text("$\(index.price)")
                                            .foregroundColor(Color("bg2"))
                                            .font(.system(size: 25, weight: .bold))
                                    })
                                    
                                    Rectangle()
                                        .fill(.gray.opacity(0.3))
                                        .frame(height: 1)
                                    
                                    Text("\(index.where_from ?? "") -> \(index.where_to ?? "")")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    HStack {
                                        
                                        Image(systemName: "arrow.up.arrow.down")
                                            .foregroundColor(Color("primary"))
                                            .font(.system(size: 18, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing, spacing: 6, content: {
                                            
                                            Text("\(index.where_from ?? "") \("Station")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 16, weight: .regular))
                                            
                                            Text("\(index.where_to ?? "") \("Station")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 16, weight: .regular))
                                        })
                                    }
                                })
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
            
            viewModel.fetchTickets()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            TicketsAdd(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isChart, content: {
            
            ChartView()
        })
    }
}

#Preview {
    TicketsView()
}
