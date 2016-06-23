//
//  TableViewCellVoto.swift
//  TocaAiOficial
//
//  Created by Victor Nogueira on 03/02/16.
//  Copyright © 2016 Victor Nogueira. All rights reserved.
//

import UIKit

class TableViewCellVoto: UITableViewCell {
    @IBOutlet weak var MusicaLabel: UILabel!

    @IBOutlet weak var VotoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
