//
//  PhotoViewController.swift
//  SlideshowApp
//
//  Created by NAOTO OMORI on 2016/07/01.
//  Copyright © 2016年 naoto.omori. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var jpg:String = ""
    
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(jpg)
        let img:UIImage = UIImage(named: jpg)!
        imgView.image=img
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
