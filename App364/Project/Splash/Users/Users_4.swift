//
//  Users_4.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI
import OneSignalFramework

struct Users_4: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                VStack(alignment: .center, spacing: 7, content: {
                    
                    Text("Miss nothing")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("The newest information especially for you")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding(.bottom, 30)
                
                Button(action: {
                    
                    OneSignal.Notifications.requestPermission({ accepted in
                      print("User accepted notifications: \(accepted)")
                        status = true
                    }, fallbackToSettings: true)
                    
                }, label: {
                    
                    Text("Enable")
                        .foregroundColor(Color("bg2"))
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
            }
            .ignoresSafeArea(.all, edges: .top)
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                    })
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    Users_4()
}
