//
//  SettingsView.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(Color("bg2"))
                    .font(.system(size: 28, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                    
                    Button(action: {
                        
                        guard let url = URL(string: DataManager().usagePolicy) else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        VStack(alignment: .leading, spacing: 30, content: {
                            
                            Image(systemName: "doc.fill")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Usage Policy")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    })
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        VStack(alignment: .leading, spacing: 30, content: {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Rate App")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    })
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteAllData()
                        
                    }, label: {
                        
                        VStack(alignment: .leading, spacing: 30, content: {
                            
                            Image(systemName: "trash.fill")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Reset Progress")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    })
                })
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
