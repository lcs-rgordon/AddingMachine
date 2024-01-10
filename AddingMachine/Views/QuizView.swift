//
//  QuizView.swift
//  AddingMachine
//
//  Created by Russell Gordon on 2024-01-10.
//

import SwiftUI

struct QuizView: View {
    
    
    var body: some View {
        HStack {
            
            // Quiz interface
            VStack {
                HStack {
                    Spacer()
                    Text("12")
                        .font(.custom("Helvetica", size: 96.0))
                }
                HStack {
                    Spacer()
                    
                    Text("+")
                    
                    Text("15")
                }
                .font(.custom("Helvetica", size: 96.0))

                Divider()
                
            }
            
            // List of past questions tried
            Text("History")
        }
        .frame(width: 800, height: 400)
    }
}

#Preview {
    QuizView()
}
