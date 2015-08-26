//
//  CardFlipTableViewController.swift
//  cell flip
//
//  Created by Mu Tong on 8/25/15.
//  Copyright (c) 2015 Tony Mu. All rights reserved.
//

import UIKit

class CardFlipTableViewController: UITableViewController {

    let cellIdentifier = "CardFlipCell"
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CardFlipTableViewCell
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) as? CardFlipTableViewCell {
            let frontView = cell.frontView
            let backView = cell.backView
            
            if(!cell.didSelect) {
                UIView.transitionWithView(cell.contentView, duration: 1.0, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: {
                    self.showFrontView(cell)
                    }, completion: nil)
            } else {
                UIView.transitionWithView(cell.contentView, duration: 1.0, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: {
                    self.showBackView(cell)
                    }, completion: nil)
            }
        }
    }
    
    func showFrontView(cell: CardFlipTableViewCell) {
        cell.frontView.hidden = false
        cell.backView.hidden = true
        
        cell.didSelect = true
    }
    
    func showBackView(cell: CardFlipTableViewCell) {
        cell.frontView.hidden = true
        cell.backView.hidden = false
        
        cell.didSelect = false
    }

    
}
