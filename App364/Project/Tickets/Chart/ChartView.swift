//
//  ChartView.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI

struct ChartView: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("bg2"))
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("bg2"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 40)
                .padding(.top)
                
                Text("Currency value")
                    .foregroundColor(.gray)
                    .font(.system(size: 12, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    Text("$\(String(format: "%.f", Double(.random(in: 40...60)))).\(String(format: "%.f", Double(.random(in: 10...80))))")
                        .foregroundColor(.black)
                        .font(.system(size: 25, weight: .semibold))
                    
                    Text("+ \(String(format: "%.f", Double(.random(in: 20...60)))).\(String(format: "%.f", Double(.random(in: 10...80))))")
                        .foregroundColor(.green)
                        .font(.system(size: 12, weight: .semibold))
                 
                    Spacer()
                }
                
                Image("graph")
                    .resizable()
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Back")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.red))
                    })
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Apply")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.green))
                    })
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ChartView()
}
