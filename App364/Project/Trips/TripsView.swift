//
//  TripsView.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI

struct TripsView: View {
    
    @StateObject var viewModel = TripsViewModel()
    
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
                
                Text("Trips")
                    .foregroundColor(Color("bg2"))
                    .font(.system(size: 28, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.horizontal, .bottom])
                
                if viewModel.trips.isEmpty {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Text("No trips added")
                            .foregroundColor(Color("bg2"))
                            .font(.system(size: 25, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("To add a trip click a plus icon on top")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.trips, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedTrip = index
                                    viewModel.isDetail = true
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 10, content: {
                                        
                                        Text((index.date ?? Date()).convertDate(format: "MMM d HH:mm"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Text(index.title ?? "")
                                            .foregroundColor(Color("bg2"))
                                            .font(.system(size: 20, weight: .semibold))
                                            .multilineTextAlignment(.leading)
                                        
                                        Text("\(index.where_from ?? "") -> \(index.where_to ?? "")")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                })
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            if let index = viewModel.selectedTrip {
                
                TripsDetail(index: index)
            }
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            TripsAdd(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchTrips()
        }
    }
}

#Preview {
    TripsView()
}
