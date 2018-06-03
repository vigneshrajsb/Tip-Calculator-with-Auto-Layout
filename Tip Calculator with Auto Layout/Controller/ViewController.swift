//
//  ViewController.swift
//  Tip Calculator with Auto Layout
//
//  Created by Vigneshraj Sekar Babu on 5/29/18.
//  Copyright © 2018 Vigneshraj Sekar Babu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var billAmount: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textAmount: UITextField!
    var data = Data()
    let bar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculate()
        setupToolbar()
        }
        
        
        
        @IBAction func sliderChanged(_ sender: UISlider) {
            sender.value = roundf(slider.value)
            calculate()
        }
        
        
        @IBAction func textEditComplete(_ sender: Any) {
            guard let text = textAmount.text else {
                fatalError("text field data missing in after text edit completes")
            }
            slider.isEnabled = true
            if textAmount.text == "" {
                
            } else {
            textAmount.text = text.contains("$") ? text : "$" + text
            }
        }
        
        
        @IBAction func textEditBegin(_ sender: UITextField) {
            slider.isEnabled = false
            textAmount.inputAccessoryView = bar
        }
        
        @objc func donePressed() {
            calculate()
            textAmount.resignFirstResponder()
        }
        
        func calculate() {
            guard let textValue = textAmount.text else { fatalError("text box value is nil when trying to calculate" )  }
            
            data.percent = slider.value
            data.totalWithoutTip = ( textValue.replacingOccurrences(of: "$", with: "") as NSString).floatValue
            tipLabel.text = "Tip (\(Int(data.percent))%)"
            tipAmount.text = "$" + String(format: "%.2f", data.tip)
            print(data.tip)
            billAmount.text = "$" + String(format: "%.2f",data.totalWithTip)
        }
        
        func setupToolbar() {
            let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
            let reset = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetTextBox))
            let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            bar.items = [reset, flexibleSpace, done]
            bar.sizeToFit()
        }
    
    @objc func resetTextBox(){
        print("resetting text box")
        textAmount.text = ""
    }
    
    
 
}

