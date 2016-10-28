//
//  FibonacciTableViewController.swift
//  FibonacciSequence
//
//  Created by David Nadri on 10/23/16.
//  Copyright © 2016 David Nadri. All rights reserved.
//
//  Calculates and displays the Fibonacci Numbers from 1 to N, where N is the
//  max for the native unsigned (positive or 0) integer type: UInt.max = 18446744073709551615
//  F(n) = F(n-1) + F(n-2)
//  Fibonacci calculator: http://php.bubble.ro/fibonacci/
//  HEX: #74ccce or rgb(116,204,206)

import UIKit

class FibonacciTableViewController: UITableViewController {
    
    private let reuseIdentifier = "FibonacciCell"
    var sequence = NSMutableArray()
    // Fibonacci number trackers
    var previousValue: Double = 0
    var fibNumber: Double = 0
    
    // - MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Self-sizing cells (as numbers grow) (Auto-Layout must be set)
        //self.tableView.rowHeight = UITableViewAutomaticDimension
        //self.tableView.estimatedRowHeight = 80
        
        // Removes extra cell separators below tableview (of empty/unused cells), if any
        //self.tableView.tableFooterView = UIView()
        
        // Load the table with an initial set of Fibonacci Numbers
        loadTable()
        
    }
    
    // - MARK: Table View Data Source
    
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return sequence.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = sequence[indexPath.row].stringValue
        
        return cell
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
        // Asynchronously updates datasource with new data when the user scrolls the content view
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
            // Adds the returned Fibonacci Number to the end of the receiver (i.e.: sequence array datasource)
            self.sequence.insertObject(self.fibonacciNumber(), atIndex: self.sequence.count)
        })
        
        // Reload the tableview with new data
        tableView.reloadData()
    }
    
    // Load the datasource with an initial set of Fibonacci results
    func loadTable() {
        for _ in 1...30 {
            sequence.addObject(fibonacciNumber())
        }
    }
    
    // Simple contextual Fibonacci logic which returns the Fibonacci Number, the sum of the previous two numbers
    func fibonacciNumber() -> Double {
        
        let tempPreviousValue = previousValue
        previousValue = fibNumber
        fibNumber += tempPreviousValue

        // If we're at the beginning of the sequence, start at 1
        if (fibNumber == 0 && previousValue == 0) {
            fibNumber = 1
        }
        
        return fibNumber
    }
    
    /*
    // Recursive Fibonacci
    func fibonacci(number: Int) -> (Int) {
        if number <= 1 {
            return number
        } else {
            return fibonacci(number - 1) + fibonacci(number - 2)
        }
    }
    */
    
    /*
    // Standard, non-recursive Fibonacci
    func fib(n: UInt) -> [Int] {
        guard n > 2 else {
            return []
        }
        
        var sequenceCount = sequence.count
        while sequenceCount < Int(n) {
            let result = sequence[sequenceCount - 1] + sequence[sequenceCount - 2]
            sequence.append(result)
            sequenceCount += 1
        }
        
        return sequence
    }
    */
    
}
