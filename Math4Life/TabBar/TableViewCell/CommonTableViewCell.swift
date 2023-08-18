//
//  CommonTableViewCell.swift
//  Math4Life
//
//  Created by PGK Shiva Kumar on 09/12/22.
//

import UIKit

class CommonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    func configureCell(percentage: String? , timer: String? , title: String?) {
//        percentageLabel.text = percentage
//        timerLabel.text = timer
//        titleLabel.text = title
//    }
    func configureCell(model: Math4LifeDataModel?) {
        percentageLabel.text = model?.percentage
        timerLabel.text = model?.time
        titleLabel.text = model?.name
    }
}
