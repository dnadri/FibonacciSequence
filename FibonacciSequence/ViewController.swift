//
//  ViewController.swift
//  FibonacciSequence
//
//  Created by David Nadri on 10/19/16.
//  Copyright © 2016 David Nadri. All rights reserved.
//

// The max for the native unsigned (positive or 0) integer type: 18446744073709551615
// F(n) = F(n-1) + F(n-2)

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        print("------------------------")
        print("UInt.max: \(UInt.max)")
        print("------------------------")
        

        print(fib(3))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func fib(n: Int) -> [Int]! {
        
        guard n > 2 else {
            return nil
        }
        
        var sequence: [Int] = [0, 1]
        var sequenceCount: Int = sequence.count
        while sequenceCount != n {
            let results: Int = sequence[sequenceCount - 1] + sequence[sequenceCount - 2]
            sequence.append(results)
            sequenceCount += 1
        }
        
        return sequence
    }

}

