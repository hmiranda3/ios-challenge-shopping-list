//
//  ItemTableViewCell.swift
//  ShoppingList
//
//  Created by Skylar Hansen on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    var delegate: ButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func completeButtonTapped(sender: AnyObject) {
        
        if let delegate = delegate {
            delegate.buttonCellButtonTapped(self)
        }
    }
    
    func updateButton(isComplete: Bool) {
        
        if isComplete {
            completeButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            completeButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }

}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(sender: ItemTableViewCell)
}

extension ItemTableViewCell {
    
    func updateWithItem(item: ShoppingList) {
        
        nameLabel.text = item.name
        updateButton(item.isComplete.boolValue)
    }
}