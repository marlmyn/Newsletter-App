//
//  MyTableViewCell.swift
//  Newsletter App
//
//  Created by Akmaral Ergesh on 15.03.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var authorLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil 
    }
    
}
