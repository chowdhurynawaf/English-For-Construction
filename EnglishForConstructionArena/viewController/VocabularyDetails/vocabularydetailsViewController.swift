//
//  vocabularydetailsViewController.swift
//  EnglishForHotelManagement
//
//  Created by sdmgap3 on 3/1/20.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit
import AVFoundation


class vocabularydetailsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let saynthesizer = AVSpeechSynthesizer()
    let tex = "Good Day"
    
    var english = ["Bonjour","Good Day","Welcome","Compliments","Regards"]
    var bangla = ["সুপ্রভাত","শুভ দিন","স্বাগত","অভিনঁদন","শুভেচ্ছা"]
    
    
    var indexNo: Int?
    
    var getname: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return english.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailscell = tableView.dequeueReusableCell(withIdentifier: "vocabularydetailsCell", for: indexPath)as! vocabularydetailsTableViewCell
        detailscell.vocabularyenglish.text = english[indexPath.row]
       detailscell.vocabularyBangla.text = english[indexPath.row]
        detailscell.vocabularyMeining.text = bangla[indexPath.row]
        return detailscell 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                indexNo = indexPath.item
    }
    
    @IBAction func playButton(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: english[indexNo ?? 0])
        saynthesizer.speak(utterance)
    }
}
