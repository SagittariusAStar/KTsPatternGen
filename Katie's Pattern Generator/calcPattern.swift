//
//  calcPattern.swift
//  Katie's Pattern Generator
//
//  Created by Daniel Huber on 16.07.16.
//  Copyright © 2016 Hell Inc. All rights reserved.
//

import UIKit
import GameplayKit

class patternGenerator{
    
    let itemCount = 50
    let seedOffset = 75
    
    func calcSeed(line : Int) -> UInt32 {
        return UInt32(line * seedOffset)
    }
    
    func getLineValues(line : Int) -> [Int]{
        var sum = 0
        var linevalues = [Int]()
        let seed = calcSeed(line)
        
        var tmp : Int = Int(seed)
        let data = NSData(bytes: &tmp, length: sizeof(Int))
        let source = GKARC4RandomSource.init(seed: data)
        let distInitValues = GKRandomDistribution.init(randomSource: source, lowestValue: -2, highestValue: 2)
        let distCorretion = GKRandomDistribution.init(randomSource: source, lowestValue: 0, highestValue: 49)
        
        for _ in 1..<itemCount {
            let current = distInitValues.nextInt()
            sum += current
            linevalues.append(current)
        }
        
        while sum != 0 {
            if sum > 0{
                //deduct 1
                var randIndex = distCorretion.nextInt()
                var localValue = linevalues[randIndex]
                while localValue < -1 {
                    randIndex = distCorretion.nextInt()
                    localValue = linevalues[randIndex]
                }
                
                linevalues[randIndex] -= 1
                sum -= 1
            } else {
                //add 1
                var randIndex = distCorretion.nextInt()
                var localValue = linevalues[randIndex]
                while localValue > 1 {
                    randIndex = distCorretion.nextInt()
                    localValue = linevalues[randIndex]
                }
                
                linevalues[randIndex] += 1
                sum += 1
            }
        }
        
        return linevalues
    }
}
