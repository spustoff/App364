//
//  NotesDetail.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI

struct NotesDetail: View {
    
    let index: NoteModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.4))
                    .frame(width: 50, height: 5)
                    .padding(.top, 5)
                
                Text(index.title ?? "")
                    .foregroundColor(Color("bg2"))
                    .font(.system(size: 18, weight: .medium))
                    .padding(.top)
                    .padding(.bottom, 50)
                
                VStack(alignment: .center, spacing: 10, content: {
                    
                    Text((index.date ?? Date()).convertDate(format: "MMM d HH:mm"))
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                    
                    Text("\(index.note ?? ""))")
                        .foregroundColor(Color("bg2"))
                        .font(.system(size: 18, weight: .medium))
                        .multilineTextAlignment(.center)
                })
                
                Spacer()
            }
        }
    }
}

//#Preview {
//    NotesDetail()
//}
