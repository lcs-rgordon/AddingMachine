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
    
    // List of prior questions
    @State var history: [Question] = [] // Empty to start
    
    // MARK: Computed properties
    var body: some View {
        HStack {
            
            // Quiz interface
            VStack(spacing: 10) {
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
                
                HStack {
                    Text(result.rawValue)
                        .padding(20)
                    
                    TextField("", text: $answerGiven)
                        .multilineTextAlignment(.trailing)
                }
                .font(.custom("Helvetica", size: 96.0))
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        // Check answer
                        checkAnswer()
                    }, label: {
                        Text("Submit")
                    })
                    
                    Button(action: {
                        // Check answer
                        newQuestion()
                    }, label: {
                        Text("New Question")
                    })
                    
                }
            }
            
            // List of past questions tried
            List(history) { currentQuestion in
                HStack {
                    Text("\(currentQuestion.firstNumber) + \(currentQuestion.secondNumber) = \(currentQuestion.answerGiven) (\(currentQuestion.firstNumber + currentQuestion.secondNumber)) \(currentQuestion.result.rawValue)")
                }
            }
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
    
    func newQuestion() {
        
        // Save the question just completed
        let oldQuestion = Question(
            firstNumber: firstNumber,
            secondNumber: secondNumber,
            answerGiven: answerGiven,
            result: result
        )
        
        // Add it to the history
        history.insert(oldQuestion, at: 0)
        
        // Resets everything
        firstNumber = Int.random(in: 1...25)
        secondNumber = Int.random(in: 1...25)
        answerGiven = ""
        result = .noInputGiven
    }
}

#Preview {
    QuizView()
}
