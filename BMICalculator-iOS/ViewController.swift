//
//  ViewController.swift
//  BMICalculator-iOS
//
//  Created by Mañanas on 2/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var weight: Double = 60.0
    private var height: Double = 170.0
    
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    
    @IBOutlet var weightStepper: UIStepper!
    @IBOutlet var heightStepper: UIStepper!
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weightStepper.value = Double(weight)
        heightStepper.value = Double(height)
        
    }
    
    @IBAction func setWeight(_ sender: UIStepper) {
        weight = sender.value
        weightLabel.text = "\(weight) Kg"
    }
    
    @IBAction func setHeight(_ sender: UIStepper) {
        height = sender.value
        heightLabel.text = "\(height) cm"
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        let result = weight / pow(height / 100, 2)
        resultLabel.text = String(format: "%.2f", result)
        
        let color: UIColor = switch result {
        case 0.0..<18.5 :
            UIColor(named: "under_weight_color")!
        case 18.5..<25.0 :
            UIColor(named: "normal_weight_color")!
        case 25.0...30 :
            UIColor(named: "over_weight_color")!
        default :
            UIColor(named: "obesity_color")!
        }
        
        resultLabel.textColor = color
    }
    
    @IBAction func closeInfo(_ sender: UIStoryboardSegue) {
        // No code needed, no need to connect the IBAction explicitely
    }
}

