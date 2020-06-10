//
//  MealSetViewCell.swift
//  CCCC Eat
//
//  Created by chang on 2020/6/9.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit

class MealSetViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateContent(meal : MealSet) {
        self.titleLabel.text = meal.name
    }

}
