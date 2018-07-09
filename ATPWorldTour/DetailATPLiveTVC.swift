//
//  DetailATPLiveTVC.swift
//  ATPWorldTour
//
//  Created by Вероника Садовская on 02.07.2018.
//  Copyright © 2018 Veronika Sadovskaya. All rights reserved.
//

import UIKit

class DetailATPLiveTVC: UITableViewController {    
    
    @IBOutlet weak var players: UILabel!
    @IBOutlet weak var fotoTeamOnePlayerOneLable: UILabel!
    @IBOutlet weak var fotoTeamOnePlayerTwoLable: UILabel!
    @IBOutlet weak var fotoTeamTwoPlayerOneLable: UILabel!
    @IBOutlet weak var fotoTeamTwoPlayerTwoLable: UILabel!
    @IBOutlet weak var fotoTeamOnePlayerOneImage: UIImageView!
    @IBOutlet weak var fotoTeamOnePlayerTwoImage: UIImageView!
    @IBOutlet weak var fotoTeamTwoPlayerOneImage: UIImageView!
    @IBOutlet weak var fotoTeamTwoPlayerTwoImage: UIImageView!
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
    let flag = String.Index(encodedOffset: 22) ..< String.Index(encodedOffset: 25)
    var  playersName = ""
    var lable:UIImageView?
    var tournamentDetail = [Tournament]()
    var matchDetail = [Match] ()
    var countFoto = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateBall(tableView: tableView)
        tableView.rowHeight = UITableViewAutomaticDimension
        //if single
        if matchDetail[0].teamOne.partnerID == nil {
            players.text = matchDetail[0].teamOne.playerOneName + " vs. " + matchDetail[0].teamTwo.playerOneName + " | " + tournamentDetail[0].name + " | " + tournamentDetail[0].location
            countFoto = 2
            
        } else {
            players.text = matchDetail[0].teamOne.playerOneName + "/" + matchDetail[0].teamOne.playerTwoName + " vs. " + matchDetail[0].teamTwo.playerOneName  + "/" + matchDetail[0].teamTwo.playerTwoName + " | " + tournamentDetail[0].name + " | " + tournamentDetail[0].location
            
        }
        
        fotoTeamOnePlayerOneLable.text = matchDetail[0].teamOne.playerOneName
        fotoTeamTwoPlayerOneLable.text = matchDetail[0].teamTwo.playerOneName
        loadImage(imageURL: self.matchDetail[0].teamOne.playerOneHeadshot, lable: fotoTeamOnePlayerOneImage)
        loadImage(imageURL: self.matchDetail[0].teamTwo.playerOneHeadshot, lable: fotoTeamTwoPlayerOneImage)
        cortName.text = matchDetail[0].roundTitle
        playerOneNameTeamOne.text = matchDetail[0].teamOne.playerOneName
        playerOneNameTeamTwo.text = matchDetail[0].teamTwo.playerOneName
        timeMatch.text = matchDetail[0].matchTime
        flagPlayerOneTeamOne?.image = UIImage(named: String(matchDetail[0].teamOne.playerOneFlag[flag]))
        flagPlayerOneTeamTwo?.image = UIImage(named: String(matchDetail[0].teamTwo.playerOneFlag[flag]))
        if matchDetail[0].teamOne.partnerID != nil {
            fotoTeamOnePlayerTwoLable.isEnabled = true
            fotoTeamTwoPlayerTwoLable.isEnabled = true
            playerTwoNameTeamOne.isEnabled = true
            playerTwoNameTeamTwo.isEnabled = true
            fotoTeamOnePlayerTwoLable.text = matchDetail[0].teamOne.playerTwoName
            fotoTeamTwoPlayerTwoLable.text = matchDetail[0].teamTwo.playerTwoName
            loadImage(imageURL: self.matchDetail[0].teamOne.playerTwoHeadshot!, lable: fotoTeamOnePlayerTwoImage)
            loadImage(imageURL: self.matchDetail[0].teamTwo.playerTwoHeadshot!, lable: fotoTeamTwoPlayerTwoImage)
            playerTwoNameTeamOne.text = matchDetail[0].teamOne.playerTwoName
            flagPlayerTwoTeamOne?.image = UIImage(named: String(matchDetail[0].teamOne.playerTwoFlag![flag]))
            flagPlayerTwoTeamTwo?.image = UIImage(named: String(matchDetail[0].teamTwo.playerTwoFlag![flag]))
            playerTwoNameTeamTwo.text = matchDetail[0].teamTwo.playerTwoName
        }
        if  matchDetail[0].teamOne.teamStatus == TeamStatus.wonGame {
            imageWinOne.image = UIImage(named: "checked")
        } else {
            imageWinTwo.image = UIImage(named: "checked")
        }
        guard let setOneTeamOne = Int(matchDetail[0].teamOne.scores["SetOne"]!!) else {return}
        self.setOneTeamOne.isEnabled = true
        self.setOneTeamOne.text = String(setOneTeamOne)
        guard let setOneTeamTwo = Int(matchDetail[0].teamTwo.scores["SetOne"]!!) else {return}
        self.setOneTeamTwo.isEnabled = true
        self.setOneTeamTwo.text =  String(setOneTeamTwo)
        guard let setTwo = Int(matchDetail[0].teamOne.scores["SetTwo"]!!) else {return }
        self.setTwoTeamOne.isEnabled = true
        self.setTwoTeamOne.text = String(setTwo)
        guard let setTwoTeamTwo = Int(matchDetail[0].teamTwo.scores["SetTwo"]!!) else {return}
        self.setTwoTeamTwo.isEnabled = true
        self.setTwoTeamTwo.text =  String(setTwoTeamTwo)
        guard let setThree = Int(matchDetail[0].teamOne.scores["SetThree"]!!) else {return}
        self.setThreeTeamOne.isEnabled = true
        self.setThreeTeamOne.text = String(setThree)
        guard let setThreeTeamTwo = Int(matchDetail[0].teamTwo.scores["SetThree"]!!) else {return}
        self.setThreeTeamTwo.isEnabled = true
        self.setThreeTeamTwo.text =  String(setThreeTeamTwo)
        guard let setFour = Int(matchDetail[0].teamOne.scores["SetFour"]!!) else {return}
        self.setFourTeamOne.isEnabled = true
        self.setFourTeamOne.text = String(setFour)
        guard let setFourTeamTwo = Int(matchDetail[0].teamTwo.scores["SetFour"]!!) else {return}
        self.setFourTeamTwo.isEnabled = true
        self.setFourTeamTwo.text =  String(setFourTeamTwo)
        guard let setFive = Int(matchDetail[0].teamOne.scores["SetFive"]!!) else {return}
        self.setFiveTeamOne.isEnabled = true
        self.setFiveTeamOne.text = String(setFive)
        guard let setFiveTeamTwo = Int(matchDetail[0].teamTwo.scores["SetFive"]!!) else {return}
        self.setFiveTeamTwo.isEnabled = true
        self.setFiveTeamTwo.text =  String(setFiveTeamTwo)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadImage(imageURL:String, lable:UIImageView)  {
        DispatchQueue.global(qos: .utility).async {
            guard let imageUrl = URL(string: "https://www.atpworldtour.com/-/ajax/scores/getinitialscores/" + imageURL) else { return }
            guard let imageData = NSData(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: imageData as Data)
                lable.image = image
                self.countFoto += 1
                if self.countFoto == 4 {
                    animateBallStop ()
                }
            }
        }
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if matchDetail[0].matchInfo == "" {
            return 3
        } else {
            return 4
        }
        
    }
    
}
