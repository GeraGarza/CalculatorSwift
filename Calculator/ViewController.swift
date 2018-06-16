//
//  ViewController.swift
//  Calculator
//
//  Created by Gera Garza on 6/4/18.
//  Copyright © 2018 Gera Garza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var numOnScreen : Double = 0
    var previousNumber : Double = 0
    var performMath : Bool = false
    var operation = 0
    var readSymbol = false;
    var clearAfterEqual = false;
    var clickedDotOnce: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func Buttons(_ sender: UIButton){
        
        
        if label.text != nil && sender.tag != 11 && sender.tag != 17 && sender.tag != 10 && readSymbol{
           
            previousNumber = Double(label.text!)!

            if sender.tag == 13{//divide
                label.text = "/"
                
                
            }
            else if sender.tag == 14{//multiply
                label.text = "x"
                
            }
            else if sender.tag == 15 {//subtract
                label.text = "-"
                
            }
            else if sender.tag == 16{//add
                label.text = "+"
            }
            
            readSymbol = false
            operation = sender.tag
            performMath = true;
            
            if sender.tag == 12 {//remained
                numOnScreen = numOnScreen / 100
                label.text = String(numOnScreen)
                readSymbol = true
            }
        }  //if pressed equal
        else if sender.tag == 17 {
            //operates the function
            
            
            if operation == 13 {//divide
                numOnScreen = previousNumber / numOnScreen
                label.text = String(numOnScreen)
            }
            if operation == 14 {//multiply
                numOnScreen =  previousNumber * numOnScreen
                label.text = String(numOnScreen)
            }
            if operation == 15 {//subtract
                numOnScreen = previousNumber - numOnScreen
                label.text = String(numOnScreen)
            }
            if operation == 16 {//add
                numOnScreen =  previousNumber + numOnScreen
                label.text = String(numOnScreen)
            }
            clearAfterEqual = true
            clickedDotOnce = true
        }
            //negative
        else if sender.tag == 11{
            numOnScreen = numOnScreen * -1
            label.text = String(numOnScreen)
            performMath = true;
        }
        else if sender.tag == 10{
            label.text  = ("0")
            numOnScreen = 0
            previousNumber = 0
            performMath = false
            operation = 0
            
        }
        
        
        
        
    }
    
    @IBAction func Numbers(_ sender: UIButton) {
        //add decimal
        //        if sender.tag == 20{
        //            label.text = label.text! + "."
        //        }
        //        if label.text == "."{
        //            label.text = String(sender.tag)
        //
        //
        
        //breaks numbers 12 + 3, ignores +
        if performMath{
            
            if sender.tag == 20 {
                label.text = "0."
                readSymbol = false
            }else{
                //first number of second number
                label.text = String(sender.tag)
            }
            numOnScreen = Double(label.text!)!
            readSymbol = true
            performMath = false
            
        }
        else{
            
            if sender.tag == 20 && clickedDotOnce{ //haven't clicked '.' in this cal
                label.text = label.text! + "."
                clickedDotOnce = false
                readSymbol = false
            }
            else{
                
                if(label.text == "0" || clearAfterEqual){   //clicked 'C'
                    label.text =  String(sender.tag)
                    clearAfterEqual = false
                }
                else{
                    if sender.tag == 20{ //already clicked '.' so ignore
                        label.text = label.text!
                        
                    }else{
                    label.text = label.text! + String(sender.tag)
                    }
                    
                }
                    numOnScreen = Double(label.text!)!
                    readSymbol = true
                
            }
        }
    }
    
}




