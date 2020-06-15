//
//  RecommendViewCell.swift
//  CCCC Eat
//
//  Created by chang on 2020/6/9.
//  Copyright © 2020 ChangYaWen. All rights reserved.
//

import UIKit

class RecommendViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = "RecommendViewCell"
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateContent(food : Food) {
        self.titleLabel.text = food.name
        self.descriptionLabel.text = "NT$ \(food.price)"
    }

}
