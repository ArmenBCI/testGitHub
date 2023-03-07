//
//  ViewController.swift
//  XAX
//
//  Created by Armen Sukiasyan on 28.02.23.
//

import UIKit





class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var stillTyping: Bool = false
    var dotIsPlaced: Bool = false
    var firstOperation: Double = 0
    var secoundOperation: Double = 0
    var Arm: String = ""
    var ketadrakanner: String = ""
    var carrentInput: Double {
        get {
            return Double(label.text!)!
        }
        set {
            label.text = "\(newValue)"
            stillTyping = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func ketBotton(_ sender: UIButton) {
        if stillTyping && !dotIsPlaced {
            label.text = label.text + "."
            dotIsPlaced = true
        }
    }
    
    
    
    @IBAction func tokosBotton(_ sender: UIButton) {
        carrentInput = sqrt(carrentInput)
    }
    
    
    
    @IBAction func plusMinusBotton(_ sender: UIButton) {
        carrentInput = -carrentInput
    }
    
    
    @IBAction func acbotton(_ sender: UIButton) {
        label.text = "0"
        stillTyping = false
    }
    
    
    
    
    @IBAction func bottons(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if stillTyping {
            if label.text!.count <= 20 {
                label.text! += number
            }
            
            } else {
                label.text = number
                stillTyping = true
            }
    
    }
    
    
    @IBAction func gorcoxutyun(_ sender: UIButton) {
        ketadrakanner = sender.currentTitle!
        firstOperation = carrentInput
        stillTyping = false
    }
    
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        carrentInput = operation(firstOperation, secoundOperation)
        stillTyping = false
    }
    
    @IBAction func havasarebotton(_ sender: UIButton) {
        
        if stillTyping {
            secoundOperation = carrentInput
        }
        
        switch ketadrakanner {
        case "+":
            operateWithTwoOperands(operation: {$0 + $1})
        case "-":
            operateWithTwoOperands(operation: {$0 - $1})
        case "✕":
            operateWithTwoOperands(operation: {$0 * $1})
        case "÷":
            operateWithTwoOperands(operation: {$0 / $1})
        default: break
        }
    }
    
}
