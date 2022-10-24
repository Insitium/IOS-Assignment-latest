//
//  ViewController.swift
//  Assignment1
//
//  Created by Name: Sarthak Vashistha on 2022-09-24
//Student ID: 301245284
//Name: Neha patel
//Student ID:301280513
//This is the UI design of a calculator which has all the buttons in iphone 13 pro for IOS 16.0 in Xcode 14.0

import UIKit

enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Null = "Null"
}

class ViewController: UIViewController {

    //result label
    @IBOutlet weak var ResultLabel: UILabel!
    
    var runningNumber = ""
    var LHS = ""
    var RHS = ""
    var result = ""
    var currentOperation:Operation = .Null
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    //Event handlers
    
    @IBAction func numberPressed(_ sender: UIButton) {
        runningNumber += "\(sender.tag)"
    
        ResultLabel.text = runningNumber
    }
   
    
    @IBAction func allClearPressed(_ sender: UIButton) {
        runningNumber = ""
        LHS = ""
        RHS = ""
        result = ""
        currentOperation = .Null
        ResultLabel.text = "0"
    }
    
    
    @IBAction func dotPressed(_ sender: UIButton) {
        
        runningNumber += "."
        ResultLabel.text = runningNumber
    }
    
    
    @IBAction func backPressed(_ sender: UIButton) {
        runningNumber = String(runningNumber.dropLast(1))
             ResultLabel.text = runningNumber
             
             if runningNumber.isEmpty {
                 runningNumber = "0"
             }
    }
    
    
    @IBAction func equalPressed(_ sender: UIButton) {
        operation(operation: currentOperation)
    }
    
    
    @IBAction func addPressed(_ sender: UIButton) {
        operation(operation: .Add)
    }
    
    @IBAction func substractPressed(_ sender: UIButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func multiplyPressed(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    
    @IBAction func percentPressed(_ sender: UIButton){
        
        
       
    }
    
    @IBAction func plusMinusPressed(_ sender: Any) {
       runningNumber = String( ResultLabel.text!)
                          runningNumber = "-" + runningNumber
                          ResultLabel.text = runningNumber
    }
    
    func operation(operation: Operation){
        if currentOperation != .Null {
            if runningNumber != ""{
                RHS = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add{
                    result = "\(Double(LHS)! + Double(RHS)!)"
                }else if currentOperation == .Subtract {
                    result = "\(Double(LHS)! - Double(RHS)!)"
                }else if currentOperation == .Multiply {
                    result = "\(Double(LHS)! * Double(RHS)!)"
                }else if currentOperation == .Divide {
                    result = "\(Double(LHS)! / Double(RHS)!)"
            
                        

                }
                LHS = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                ResultLabel.text = result
            }
            currentOperation = operation
        }else {
            LHS = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

