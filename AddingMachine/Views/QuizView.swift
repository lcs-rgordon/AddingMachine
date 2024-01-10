//
//  QuizView.swift
//  AddingMachine
//
//  Created by Russell Gordon on 2024-01-10.
//

import SwiftUI

struct QuizView: View {
    
    // MARK: Stored properties
    @State var firstNumber = Int.random(in: 1...25)
    @State var secondNumber = Int.random(in: 1...25)
    @State var answerGiven = ""
    @State var result: AnswerState = .noInputGiven
    
    // MARK: Computed properties
    var body: some View {
        HStack {
            
            // Quiz interface
            VStack {
                HStack {
                    Spacer()
                    Text("\(firstNumber)")
                        .font(.custom("Helvetica", size: 96.0))
                }
                HStack {
                    Text("+")
                    
                    Spacer()
                    
                    Text("\(secondNumber)")
                }
                .font(.custom("Helvetica", size: 96.0))

                Divider()
                
                TextField("Answer", text: $answerGiven)
                    .font(.custom("Helvetica", size: 96.0))
                    .multilineTextAlignment(.trailing)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        // Check answer
                    }, label: {
                        Text("Submit")
                    })
                }
            }
            
            // List of past questions tried
            Text("History")
        }
        .frame(width: 800, height: 400)
    }
    
    // MARK: Functions
    func checkAnswer() {
        let correctAnswer = firstNumber + secondNumber
        
        // Try to make the answer given into an integer
        guard let answerGivenAsInteger = Int(answerGiven) else {
            // Can't make input into an integer
            return
        }
        
        if answerGivenAsInteger == correctAnswer {
            // Tell the user they got it right
            result = .correct
        } else {
            result = .incorrect
        }
    }
}

#Preview {
    QuizView()
}
