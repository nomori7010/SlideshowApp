//
//  ViewController.swift
//  SlideshowApp
//
//  Created by NAOTO OMORI on 2016/07/01.
//  Copyright © 2016年 naoto.omori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideShowImage: UIImageView!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    var n = 0
    var timer:NSTimer!
    let jpgs = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let img:UIImage = UIImage(named: jpgs[n])!
        slideShowImage.image=img
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func prev() {
        n += 1
        if jpgs.count - 1 < n {
            n = 0
        }
        let img:UIImage = UIImage(named: jpgs[n])!
        slideShowImage.image=img
    }
        
    @IBAction func prev(sender: UIButton) {
        prev()
    }
    @IBAction func back(sender: UIButton) {
        n -= 1
        if n < 0 {
            n = jpgs.count - 1
        }
        let img:UIImage = UIImage(named: jpgs[n])!
        slideShowImage.image=img
    }
    @IBAction func play(sender: UIButton) {
        if sender.currentTitle == "再生" {
            print("play")
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.prev(_:)), userInfo: nil, repeats: true)
            sender.setTitle("停止", forState: UIControlState.Normal)
            prevButton.enabled = false
            backButton.enabled = false
        } else {
            print("stop")
            stopSlideShow()
        }
    }
    func stopSlideShow(){
        timer.invalidate()
        playButton.setTitle("再生", forState: UIControlState.Normal)
        prevButton.enabled = true
        backButton.enabled = true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: UITouch in touches {
            let tag = touch.view!.tag
            switch tag {
            case 1:
                stopSlideShow()
                let PhotoView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("PhotoView")
                let pv :PhotoViewController = PhotoView as! PhotoViewController
                pv.jpg = jpgs[n]
                self.presentViewController(pv, animated: true, completion: nil)                
            default:
                break
            }
        }
    }
    
}

