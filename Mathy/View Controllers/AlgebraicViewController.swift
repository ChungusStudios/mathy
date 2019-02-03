//
//  AlgebraicViewController.swift
//  Mathy 2.9
//
//  Created by Sherman Lui on 28/1/2019.
//  Copyright © 2019 Agent Orange Studio. All rights reserved.
//

import UIKit

class AlgebraicViewController: UIViewController {
    @IBOutlet weak var AlgebraQuestion: UILabel!
    @IBOutlet weak var AlgebraAnswer: UILabel!
    @IBOutlet weak var generateQuestion: UIButton!
    
    @IBAction func btnBackToCourceView(_ sender: UIButton) {
    print("Back Button Pressed(Algebra)")
    self.performSegue(withIdentifier: "BackToHomeSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Algebraic")
    
        
        
 
        
        
        enum Operation: String {
            case addition = "+"
            case subtraction = "-"
            case multiplication = "*"
            case division = "/"
            
            
            static func all() -> [Operation] {
                return [.addition, .subtraction, .multiplication, .division]
            }
            
            static func random() -> Operation {
                let all = Operation.all()
                let selection = Int(arc4random_uniform(UInt32(all.count)))
                return all[selection]
            }
            
        }
        
        
        func addNewTerm(formula: String, result: Int) -> (formula: String, result: Int) {
            // choose a random number and operation
            let operation = Operation.random()
            let number = chooseRandomNumberFor(operation: operation, on: result)
            // apply to the left side
            let newFormula = applyTermTo(formula: formula, number: number, operation: operation)
            // apply to the right side
            let newResult = applyTermTo(result: result, number: number, operation: operation)
            return (newFormula, newResult)
        }
        
        func applyTermTo(formula: String, number:Int, operation:Operation) -> String {
            return "\(formula) \(operation.rawValue) \(number)"
        }
        
        func applyTermTo(result: Int, number:Int, operation:Operation) -> Int {
            switch(operation) {
            case .addition: return result + number
            case .subtraction: return result - number
            case .multiplication: return result * number
            case .division: return result / number
            }
        }
        
        func chooseRandomNumberFor(operation: Operation, on number: Int) -> Int {
            switch(operation) {
            case .addition, .subtraction, .multiplication:
                return Int(arc4random_uniform(10) + 1)
            case .division:
                // add code here to find integer factors
                return 1
            }
        }
        
        
        func generateFormula(_ numTerms:Int = 1) -> (String, Int) {
            let x = Int(arc4random_uniform(10))
            var leftSide = "x"
            var result = x
            
            for i in 1...numTerms {
                (leftSide, result) = addNewTerm(formula: leftSide, result: result)
                if i < numTerms {
                    leftSide = "(" + leftSide + ")"
                }
            }
            
            let formula = "\(leftSide) = \(result)"
            
            return (formula, x)
        }
        
        func printFormula(_ numTerms:Int = 1) {
            let (formula, x) = generateFormula(numTerms)
            print(formula, "                      x = ", x)
            AlgebraQuestion.text = formula
            AlgebraAnswer.text = String(x)
        }
        
        
        for i in 1...30{
            printFormula(Int(arc4random_uniform(3)) + 1)
        }
        
        
        
        
    }
    
    
}

