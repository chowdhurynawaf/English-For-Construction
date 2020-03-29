//
//  interviewViewController.swift
//  EnglishForHotelManagement
//
//  Created by sdmgap3 on 3/3/20.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit
import AVFoundation

class interviewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
        
    
    var interviewenglish = ["Good morning, How can I help you?","Hello I would like to book a room for tonight"]
var interviewbangla = ["শুভ সকাল, আমি কিভাবে তোমাকে সাহায্য করতে পারি?","হ্যালো আমি আজ রাতের জন্য একটি রুম বুক করতে চাই"]
    
    
    let saynthesizer = AVSpeechSynthesizer()
    let tex = "Good Day"
    
    var indexNo: Int?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interviewenglish.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let interviewcell = tableView.dequeueReusableCell(withIdentifier: "myinterviewCell", for: indexPath)as! interviewTableViewCell
        interviewcell.interviewtextEnglish.text = interviewenglish[indexPath.row]
        interviewcell.interviewtextBangla.text = interviewbangla[indexPath.row]

        return interviewcell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                     indexNo = indexPath.item
         }
    

    @IBAction func playbutton(_ sender: Any) {
        
        let utterance = AVSpeechUtterance(string: interviewenglish[indexNo ?? 0])
        saynthesizer.speak(utterance)
        
    }
    
    
}
