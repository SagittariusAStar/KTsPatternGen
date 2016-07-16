//
//  ViewController.swift
//  Katie's Pattern Generator
//
//  Created by Daniel Huber on 15.07.16.
//  Copyright © 2016 Hell Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
    @IBOutlet weak var stepLineNumber: UIStepper!
    @IBOutlet weak var CalcLine: UIButton!
    @IBOutlet weak var insertLine: UITextField!
    @IBOutlet weak var testOutput: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        insertLine.delegate = self;
        stepLineNumber.value = 1;
        insertLine.text = String(format:"%.0f",stepLineNumber.value);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func stepValueChanged(sender: AnyObject) {
        insertLine.text = String(format:"%.0f",stepLineNumber.value);
    }
    
    @IBAction func getLine(sender: UIButton) {
        let patGen = patternGenerator(l: Int(stepLineNumber.value));
        patGen.createInitRow();
        
        let currentRow = patGen.getRowValues();
        var testString :String = "";
        for i in 0...currentRow.count-1{
            if i % 5 == 0{
                testString += "\r\n";
            }
            testString += " " + String(currentRow[i]);
        }
        
        testOutput.text = testString;
    }
    
    func textFieldShouldReturn(textfield: UITextField) -> Bool {
        insertLine.resignFirstResponder();
        return true;
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        let testD = Double(textField.text!);
        if testD != nil{
            stepLineNumber.value = testD!;
        }
    }
}

