//
//  MovieCell.swift
//  Flix
//
//  Created by Will Gilman on 3/29/17.
//  Copyright © 2017 Will Gilman. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        let color: UIColor = highlighted ? .black : .darkGray
        let size: CGFloat = highlighted ? 21.0 : 19.0
        self.titleLabel.font = self.titleLabel.font.withSize(size)
        self.titleLabel.textColor = color
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // These effect don't look good for this app.
    }

}
