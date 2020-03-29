//
//  ReceptionViewController.swift
//  EnglishForHotelManagement
//
//  Created by sdmgap3 on 3/3/20.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit
import AVFoundation


class ReceptionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var receptionEnglish = ["Do you have reservation?","How long will you be staying","Could i see your ID, please?","Could you please fill out this frome"]
    var receptionBangla = ["আপনার কি সংরক্ষণ আছে?","আপনি আর কত দিন থাকবেন","আমি কি আপনার আইডি দেখতে পারি","দয়া করে এই ফ্রমটি পূরণ করতে পারেন"]
    
    
    var indexNo: Int?

    let saynthesizer = AVSpeechSynthesizer()
    let tex = "Good Day"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receptionEnglish.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let receptioncell = tableView.dequeueReusableCell(withIdentifier: "myReceptionCell", for: indexPath)as! ReceptionTableViewCell
        receptioncell.englisg.text = receptionEnglish[indexPath.row]
        receptioncell.bangla.text = receptionBangla[indexPath.row]
        return receptioncell
    }
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                  indexNo = indexPath.item
      }

    @IBAction func playAction(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: receptionEnglish[indexNo ?? 0])
        saynthesizer.speak(utterance)
    }
}
