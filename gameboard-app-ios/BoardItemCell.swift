//
//  NewsItemCell.swift
//  StretchyHeaders
//
//  Created by Matthew Perrins on 09/11/2015.
//  Copyright © 2015 Matthew Perrins. All rights reserved.
//

import UIKit

class BoardItemCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    @IBOutlet weak var rankLabel: UILabel!
    
    var boardItem: BoardItem? {
        didSet {
            if let item = boardItem {
                categoryLabel.text = item.category.toString()
                categoryLabel.textColor = item.category.toColor()
                summaryLabel.text = item.summary
                rankLabel.text = String(item.rank)
            }
            else {
                categoryLabel.text = nil
                summaryLabel.text = nil
                rankLabel.text = nil
            }
        }
    }
    
    
}
