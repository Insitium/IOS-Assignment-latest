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
    case Percent = "%"
    case Pi = "π"
    case sqrt = "2√x"
    case random = "rand"
    case sin = "sin"
    case Null = "Null"
}

class ViewController: UIViewController {

    @IBOutlet weak var ResultLabel: UITextField!
    //result label
    
    @IBOutlet weak var landScapeResultLabel: UILabel!
    
    var runningNumber = ""
    var LandscapeRunningNumber = ""
    var landscapeLHS = ""
    var landscapeRHS = ""
    var landscapeResult = ""
    var landscapeCurrentOperation:Operation = .Null
    
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
        print(runningNumber)
        ResultLabel.text = runningNumber
    }
   
    @IBAction func landscapeNumberButtonPressed(_ sender: UIButton) {
        LandscapeRunningNumber += "\(sender.tag)"
        print(LandscapeRunningNumber)
        landScapeResultLabel.text = LandscapeRunningNumber
        
    }
    
    @IBAction func allClearPressed(_ sender: UIButton) {
        runningNumber = ""
        LHS = ""
        RHS = ""
        result = ""
        currentOperation = .Null
        ResultLabel.text = "0"
        LandscapeRunningNumber = ""
        landscapeLHS = ""
        landscapeRHS = ""
        landscapeResult = ""
        landscapeCurrentOperation = .Null
        landScapeResultLabel.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        
        runningNumber += "."
        ResultLabel.text = runningNumber
    }
    
    @IBAction func LandscapeDotPressed(_ sender: UIButton) {
        LandscapeRunningNumber += "."
        landScapeResultLabel.text = LandscapeRunningNumber
    }
   
    @IBAction func backPressed(_ sender: UIButton) {
        runningNumber = String(runningNumber.dropLast(1))
             ResultLabel.text = runningNumber
             
             if runningNumber.isEmpty {
                 runningNumber = "0"
             }
    }
    
    @IBAction func LandscapeBackPressed(_ sender: UIButton) {
        LandscapeRunningNumber=String(LandscapeRunningNumber.dropLast(1))
        landScapeResultLabel.text = LandscapeRunningNumber
        
        if LandscapeRunningNumber.isEmpty{
            LandscapeRunningNumber = "0"
        }
    }
    
 
    @IBAction func equalPressed(_ sender: UIButton) {
        operation(operation: currentOperation)
    }
    
    @IBAction func landscapeEqualPressed(_ sender: UIButton) {
        landscapeOperation(landscapeOperation: landscapeCurrentOperation)
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        operation(operation: .Add)
    }
    
    @IBAction func landscapeAddPressed(_ sender: UIButton) {
        landscapeOperation(landscapeOperation: .Add)
    }
    
    
    @IBAction func substractPressed(_ sender: UIButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func landscapeSubstractPressed(_ sender: UIButton) {
        landscapeOperation(landscapeOperation: .Subtract)
    }
    
    
    @IBAction func multiplyPressed(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func landscapeMultiplyPressed(_ sender: UIButton) {
        landscapeOperation(landscapeOperation: .Multiply)
    }
    
    
    
    @IBAction func dividePressed(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    
    @IBAction func landscapeDividePressed(_ sender: UIButton) {
        landscapeOperation(landscapeOperation: .Divide)
    }
    
    
    @IBAction func percentPressed(_ sender: UIButton){
        operation(operation: .Percent)
    }
    
    @IBAction func landscapePercentPressed(_ sender: UIButton) {
        landscapeOperation(landscapeOperation: .Percent)
    }
    
    
    @IBAction func plusMinusPressed(_ sender: Any) {
       runningNumber = String( ResultLabel.text!)
                          runningNumber = "-" + runningNumber
                          ResultLabel.text = runningNumber
    }
    
    
    @IBAction func landscapePlusMinusPressed(_ sender: UIButton) {
        LandscapeRunningNumber = String( landScapeResultLabel.text!)
        LandscapeRunningNumber = "-" + LandscapeRunningNumber
        landScapeResultLabel.text = LandscapeRunningNumber
    }
    
    
    func landscapeOperation(landscapeOperation: Operation){
        if landscapeCurrentOperation != .Null {
            if LandscapeRunningNumber != ""{
                landscapeRHS = LandscapeRunningNumber
                LandscapeRunningNumber = ""
                
                if landscapeCurrentOperation == .Add{
                    landscapeResult = "\(Double(landscapeLHS)! + Double(landscapeRHS)!)"
                }else if landscapeCurrentOperation == .Subtract {
                    landscapeResult = "\(Double(landscapeLHS)! - Double(landscapeRHS)!)"
                }else if landscapeCurrentOperation == .Multiply {
                    landscapeResult = "\(Double(landscapeLHS)! * Double(landscapeRHS)!)"
                }else if landscapeCurrentOperation == .Divide {
                    landscapeResult = "\(Double(landscapeLHS)! / Double(landscapeRHS)!)"
                }else if landscapeCurrentOperation == .Percent{
                    landscapeResult = "\(Double(landscapeLHS)! / Double(100))"
                }else if landscapeCurrentOperation == .Pi{
                    landscapeResult = "\(Double(landscapeLHS)! / Double(100) + Double(3.14))"
                }else if landscapeCurrentOperation == .sqrt{
                    landscapeResult = "\(Double(landscapeLHS)! * Double(1/2))"
                }else if landscapeCurrentOperation == .random{
                    landscapeResult = "\(Double(landscapeLHS)!)"
                }else if landscapeCurrentOperation == .sin{
                    landscapeResult = "\(Double(landscapeLHS)! / Double(180) * Double(3.14) )"
                }
                landscapeLHS = landscapeResult
                if (Double(landscapeResult)!.truncatingRemainder(dividingBy: 1) == 0){
                    landscapeResult = "\(Int(Double(landscapeResult)!))"
                }
                landScapeResultLabel.text = landscapeResult
            }
            landscapeCurrentOperation = landscapeOperation
        }else {
            landscapeLHS = runningNumber
            LandscapeRunningNumber = ""
            landscapeCurrentOperation = landscapeOperation
        }
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
                }else if currentOperation == .Percent {
                    result = "\(Double(LHS)! / Double(100))"
                }else if currentOperation == .Pi {
                    result = "\(Double(LHS)! / Double(100) + Double(3.14))"
                }else if currentOperation == .sqrt {
                    result = "\(Double(LHS)! * Double(1/2))"

                }else if currentOperation == .random {
                    result = "\(Double(LHS)!)"
                    
                }else if currentOperation == .sin {
                    result = "\(Double(LHS)! / Double(180) + Double(3.14))"
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

