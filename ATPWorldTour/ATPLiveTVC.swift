//
//  ATPLiveTVC.swift
//  ATPWorldTour
//
//  Created by Вероника Садовская on 28.06.2018.
//  Copyright © 2018 Veronika Sadovskaya. All rights reserved.
//

import UIKit
class ATPLiveTVC: UITableViewController  {
    var spinner: UIActivityIndicatorView!
    var spinnerBall: UIImageView!
     let imageBall = UIImage(named: "tennis")
    //var spinner: UIActivityIndicatorView!
    var tournaments = [Tournament]()
    var match = [Match] ()
    var score = [String: String?] ()
    let flag = String.Index(encodedOffset: 22) ..< String.Index(encodedOffset: 25)
    override func viewDidLoad() {
        super.viewDidLoad()
        sendRequest()
        animateBall(tableView: tableView)
        tableView.allowsSelection = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func sendRequest() {
        let jsonUrl = "https://www.atpworldtour.com/-/ajax/scores/getinitialscores/"
        DispatchQueue.global(qos: .utility).async {
            guard let url = URL(string: jsonUrl) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, responce, error) in
                
                guard let data = data else { return }
                
                do {
                    let scores = try JSONDecoder().decode(Scores.self, from: data)
                    self.tournaments = scores.liveScores.tournaments
                    //print(self.match)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                      animateBallStop ()
                    }
                    
                } catch let jsonError {
                    print("Ошибка получения данных", jsonError)
                }
                }.resume()
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.tournaments.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tournaments[section].matches.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     
        return "\(self.tournaments[section].name)"
    }
    

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        header.textLabel?.textAlignment = .center
        header.backgroundView?.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        DispatchQueue.global(qos: .utility).async {
            guard let imageUrl = URL(string: "https://www.atpworldtour.com/-/ajax/scores/getinitialscores/" + self.tournaments[section].tournamentBadgeImage) else { return }
            guard let imageData = NSData(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: imageData as Data)
                imageView.image = image
               header.contentView.addSubview((imageView))

            }

        }

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ATPLiveTVCell
        self.match = tournaments[indexPath.section].matches
            cell.cortName.text = match[indexPath.row].roundTitle
            cell.playerOneNameTeamOne.text = match[indexPath.row].teamOne.playerOneName
            cell.playerOneNameTeamTwo.text = match[indexPath.row].teamTwo.playerOneName
            cell.timeMatch.text = match[indexPath.row].matchTime
            cell.flagPlayerOneTeamOne?.image = UIImage(named: String(match[indexPath.row].teamOne.playerOneFlag[flag]))
            cell.flagPlayerOneTeamTwo?.image = UIImage(named: String(match[indexPath.row].teamTwo.playerOneFlag[flag]))
            score = match[indexPath.row].teamOne.scores
        if  match[indexPath.row].teamOne.playerTwoName == " " {
            cell.playerTwoNameTeamOne.isHidden = true
            cell.flagPlayerTwoTeamOne.isHidden = true
            cell.flagPlayerTwoTeamTwo.isHidden = true
            cell.playerTwoNameTeamTwo.isHidden = true
            cell.flagPlayerTwoTeamOne.contentMode = .scaleAspectFill
        } else {
            cell.playerTwoNameTeamOne.text = match[indexPath.row].teamOne.playerTwoName
            cell.flagPlayerTwoTeamOne?.image = UIImage(named: String(match[indexPath.row].teamOne.playerTwoFlag![flag]))
            cell.flagPlayerTwoTeamTwo?.image = UIImage(named: String(match[indexPath.row].teamTwo.playerTwoFlag![flag]))
            cell.playerTwoNameTeamTwo.text = match[indexPath.row].teamTwo.playerTwoName
        }
        if  match[indexPath.row].teamOne.teamStatus == TeamStatus.wonGame {
            cell.imageWinOne.image = UIImage(named: "checked")
        } else {
            cell.imageWinTwo.image = UIImage(named: "checked")
        }
        guard let setOneTeamOne = Int(match[indexPath.row].teamOne.scores["SetOne"]!!) else {return cell}
        cell.setOneTeamOne.isEnabled = true
        cell.setOneTeamOne.text = String(setOneTeamOne)
        guard let setOneTeamTwo = Int(match[indexPath.row].teamTwo.scores["SetOne"]!!) else {return cell}
        cell.setOneTeamTwo.isEnabled = true
        cell.setOneTeamTwo.text =  String(setOneTeamTwo)
        guard let setTwo = Int(match[indexPath.row].teamOne.scores["SetTwo"]!!) else {return cell}
        cell.setTwoTeamOne.isEnabled = true
        cell.setTwoTeamOne.text = String(setTwo)
        guard let setTwoTeamTwo = Int(match[indexPath.row].teamTwo.scores["SetTwo"]!!) else {return cell}
        cell.setTwoTeamTwo.isEnabled = true
        cell.setTwoTeamTwo.text =  String(setTwoTeamTwo)
        guard let setThree = Int(match[indexPath.row].teamOne.scores["SetThree"]!!) else {return cell}
        cell.setThreeTeamOne.isEnabled = true
        cell.setThreeTeamOne.text = String(setThree)
        guard let setThreeTeamTwo = Int(match[indexPath.row].teamTwo.scores["SetThree"]!!) else {return cell}
        cell.setThreeTeamTwo.isEnabled = true
        cell.setThreeTeamTwo.text =  String(setThreeTeamTwo)
        guard let setFour = Int(match[indexPath.row].teamOne.scores["SetFour"]!!) else {return cell}
        cell.setFourTeamOne.isEnabled = true
        cell.setFourTeamOne.text = String(setFour)
        guard let setFourTeamTwo = Int(match[indexPath.row].teamTwo.scores["SetFour"]!!) else {return cell}
        cell.setFourTeamTwo.isEnabled = true
        cell.setFourTeamTwo.text =  String(setFourTeamTwo)
        guard let setFive = Int(match[indexPath.row].teamOne.scores["SetFive"]!!) else {return cell}
        cell.setFiveTeamOne.isEnabled = true
        cell.setFiveTeamOne.text = String(setFive)
        guard let setFiveTeamTwo = Int(match[indexPath.row].teamTwo.scores["SetFive"]!!) else {return cell}
        cell.setFiveTeamTwo.isEnabled = true
        cell.setFiveTeamTwo.text =  String(setFiveTeamTwo)
        return cell
    }
    
   
    @IBAction func refresh(_ sender: UIBarButtonItem) {
       sendRequest()
    animateBall(tableView: tableView)
    
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"  {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! DetailATPLiveTVC
                dvc.tournamentDetail = [tournaments[indexPath.section]]
                dvc.matchDetail = [match[indexPath.row]]
                dvc.playersName = match[indexPath.row].teamOne.playerOneName
            }
        }
    }
    


}
