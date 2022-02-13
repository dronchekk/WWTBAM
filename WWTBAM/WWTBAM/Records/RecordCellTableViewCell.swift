//
//  RecordCellTableViewCell.swift
//  WWTBAM
//
//  Created by Andrey Rachitskiy on 11.02.2022.
//

import UIKit

class RecordCellTableViewCell: UITableViewCell {

    @IBOutlet weak var dataTitle: UILabel!
    @IBOutlet weak var dataSubtitile: UILabel!

    @IBOutlet weak var resultTitle: UILabel!
    @IBOutlet weak var resultSubtitle: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
