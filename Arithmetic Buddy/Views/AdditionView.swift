//
//  AdditionView.swift
//  ArithmeticBuddy
//
//  Created by Russell Gordon on 2024-01-30.
//

import SwiftUI

struct AdditionView: View {
    
    // MARK: Stored properties
    
    // What number the user has guessed
    @State var givenInput = ""
    
    @State var guessesMade: [Int] = []
    
    // The two numbers the user must add
    @State var firstNumber = Int.random(in: 1...25)
    @State var secondNumber = Int.random(in: 1...25)
    
    // MARK: Computed properties
    
    // The correct sum of the randomly generated numbers
    var correctSum: Int {
        return firstNumber + secondNumber
    }
    
    // Feedback to the user
    @State var feedback = ""
    
    // The user interface
    var body: some View {
        
        VStack(spacing: 0) {
            
            Spacer()
            
            HStack {
                Spacer()
                Text("\(firstNumber)")
                    .font(Font.system(size: 50))
                    .padding(.trailing)
            }
            
            HStack {
                Text("+")
                    .font(Font.system(size: 50))
                Spacer()
                Text("\(secondNumber)")
                    .font(Font.system(size: 50))
                    .padding(.trailing)
            }
                        
            Divider()
            
            HStack (alignment: .lastTextBaseline){
                Spacer()
                TextField("Enter The Sum", text: $givenInput)
                    .frame(width: 320, height: 50)
                    .padding()
                    .font(Font.system(size: 50))
                    .multilineTextAlignment(.trailing)
            }
            
            Spacer()
            
            Button {
                checkAnswer()
            } label: {
                Text("Check Answer")
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            Text(feedback)
                .font(
                    .custom(
                        "BradleyHandITCTT-Bold",
                        size: 24.0,
                        relativeTo: .title3
                    )
                )
            
            Spacer()
            
            Button {
                reset()
            } label: {
                Text("Reset")
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .padding()
    }
    
    // MARK: Functions
    
    // Check whether the user's answer was correct
    // Provide appropriate feedback
    func checkAnswer() {
        guard let selectedNumber = Int(givenInput) else {
            feedback = "Please provide an integer."
            return
        }
        
        // Provide feedback to the user
        // When should they guess higher?
        // When should then guess lower?
        // FILL IN THIS CODE
        
        if selectedNumber > correctSum {
            feedback = "Less"
        } else if correctSum > selectedNumber{
            feedback = "More"
        }
        else{
            feedback = "Correct Answer!"
        }
        
    }
    
    // Reset for a new question
    func reset() {
        
        firstNumber = Int.random(in: 1...25)
        secondNumber = Int.random(in: 1...25)
        feedback = ""
        
    }
}

#Preview {
    AdditionView()
}
