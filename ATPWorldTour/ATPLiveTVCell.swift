//
//  ATPLiveTVCell.swift
//  ATPWorldTour
//
//  Created by Вероника Садовская on 28.06.2018.
//  Copyright © 2018 Veronika Sadovskaya. All rights reserved.
//

import UIKit

class ATPLiveTVCell: UITableViewCell {

    @IBOutlet weak var cortName: UILabel!
    @IBOutlet weak var playerOneNameTeamOne: UILabel!
    @IBOutlet weak var playerTwoNameTeamOne: UILabel!
    @IBOutlet weak var playerOneNameTeamTwo: UILabel!
    @IBOutlet weak var playerTwoNameTeamTwo: UILabel!
    @IBOutlet weak var timeMatch: UILabel!
    @IBOutlet weak var flagPlayerOneTeamOne: UIImageView!
    @IBOutlet weak var flagPlayerTwoTeamOne: UIImageView!
    @IBOutlet weak var flagPlayerOneTeamTwo: UIImageView!
    @IBOutlet weak var flagPlayerTwoTeamTwo: UIImageView!
    @IBOutlet weak var setOneTeamOne: UILabel!
    @IBOutlet weak var setTwoTeamOne: UILabel!
    @IBOutlet weak var setThreeTeamOne: UILabel!
    @IBOutlet weak var setFourTeamOne: UILabel!
    @IBOutlet weak var setFiveTeamOne: UILabel!
    @IBOutlet weak var setOneTeamTwo: UILabel!
    @IBOutlet weak var setTwoTeamTwo: UILabel!
    @IBOutlet weak var setThreeTeamTwo: UILabel!
    @IBOutlet weak var setFourTeamTwo: UILabel!
    @IBOutlet weak var setFiveTeamTwo: UILabel!
    @IBOutlet weak var imageWinOne: UIImageView!
    @IBOutlet weak var imageWinTwo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
