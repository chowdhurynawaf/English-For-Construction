//
//  lessonViewController.swift
//  EnglishForHotelManagement
//
//  Created by sdmgap3 on 2/26/20.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit

class lessonViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var lessonview1: UIView!
    @IBOutlet weak var lessonview2: UIView!
    
    @IBOutlet weak var lessonbutton: UIButton!
    var background = ["2. Lessons-2","3. Warnings-2","4. Errors-2","5. Calls-2"]
    var lessonicon = ["Group 18","Group 20","Group 19","Group 21"]
    var lessontag = ["Vocabulary","Sentence","Conversation","Interview"]
    var vocalularyArry = ["Greetings","Reception","Services","Kitchen","Foods","Interview"]
    var vocabularyIMG = ["waving-hand 1","Group 43","clock 1","Group 42","food 1","Group 62"]
    override func viewDidLoad() {
        super.viewDidLoad()
        lessonview1.layer.cornerRadius = 15
        lessonview2.layer.cornerRadius = 15
        lessonbutton.layer.cornerRadius = 24
        imageview.layer.cornerRadius = 50

        // Do any additional setup after loading the view.
    }
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return background.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let lessoncell = collectionView.dequeueReusableCell(withReuseIdentifier: "mylessonCell", for: indexPath)as! lessonCollectionViewCell
    lessoncell.lessonbackroundimg.image = UIImage(named: background[indexPath.row] + ".png")
    lessoncell.lessoniconimg.image = UIImage(named: lessonicon[indexPath.row] + ".png")
    lessoncell.lessontaglb.text = lessontag[indexPath.row]
    return lessoncell
   }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "lesson to vocabulary", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                let vc = segue.destination as! vocabolaryViewController
        vc.getname = vocalularyArry
        vc.getimage = vocabularyIMG
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 30) / 2
        let height = width / 1.2
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
