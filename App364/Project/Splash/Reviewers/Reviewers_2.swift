//
//  Reviewers_2.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI

struct Reviewers_2: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Image("reviewers_2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                VStack(alignment: .center, spacing: 7, content: {
                    
                    Text("Keep tickets")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("And all important information")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding(.bottom, 30)
                
                NavigationLink(destination: {
                    
                    Reviewers_3()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(Color("bg2"))
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    Reviewers_2()
}
