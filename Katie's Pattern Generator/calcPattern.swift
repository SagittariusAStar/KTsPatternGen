//
//  calcPattern.swift
//  Katie's Pattern Generator
//
//  Created by Daniel Huber on 16.07.16.
//  Copyright © 2016 Hell Inc. All rights reserved.
//

import UIKit

class patternGenerator{
    
    let itemCount = 50
    var line: Int
    var someInts = [Int]()
    
    init(l:Int){
        self.line = l;
    }
    
    func createInitRow(){
        for _ in 0...line {
            someInts = [];
            createNextRow();
        }
    }
    
    func createNewRow(){
        line += 1;
        createNextRow();
    }
    
    func getRowValues() -> [Int]{
        return someInts;
    }
    
    func createNextRow(){
        var sum: Int = 0;
        for _ in 1...itemCount {
            let x = arc4random_uniform(5);
            var y: Int;
            y = Int(x) - 2;
            someInts.append(y);
            sum += y
        }
        
        while sum != 0 {
            if sum > 0{
                //deduct 1
                var randIndex = Int(arc4random_uniform(50));
                var localValue = someInts[randIndex];
                while localValue < -1 {
                    randIndex = Int(arc4random_uniform(50));
                    localValue = someInts[randIndex];
                }
                
                someInts[randIndex] -= 1;
                sum -= 1;
            } else {
                //add 1
                var randIndex = Int(arc4random_uniform(50));
                var localValue = someInts[randIndex];
                while localValue > 1 {
                    randIndex = Int(arc4random_uniform(50));
                    localValue = someInts[randIndex];
                }
                
                someInts[randIndex] += 1;
                sum += 1;
            }
        }
    }
    
    
}
