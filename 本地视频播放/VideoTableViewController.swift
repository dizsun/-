//
//  VideoTableViewController.swift
//  本地视频播放
//
//  Created by SunDiz on 16/4/12.
//  Copyright © 2016年 SunDiz. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoTableViewController: UITableViewController {

    @IBOutlet weak var videoTableView: UITableView!
    
    var data = [
        
        video(image: "p1.jpg", title: "こんにちは", source: "huanzhu"),
        video(image: "p2.jpg", title: "おはようございます", source: "葫芦娃"),
        video(image: "p3.jpg", title: "ちょっと待ってく", source: "江南皮革厂倒闭了"),
        video(image: "p4.jpg", title: "うさまでした", source: "人人车")
    ]
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoTableView.dataSource = self
        videoTableView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playVideoButtonDidTouch(sender: UIButton) {
        let supview = sender.superview?.superview as! VideoCell
        let videoSource = supview.videoSourceLabel
        if let path = NSBundle.mainBundle().pathForResource(videoSource, ofType: "mp4"){
           
            playerView = AVPlayer(URL: NSURL(fileURLWithPath: path))
            
            playViewController.player = playerView
            
            self.presentViewController(playViewController, animated: true) {
                self.playViewController.player?.play()
            }
        }

    }
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = videoTableView.dequeueReusableCellWithIdentifier("VideoCell", forIndexPath: indexPath) as! VideoCell
        let video = data[indexPath.row]
        
        cell.videoScreenShot.image = UIImage(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel = video.source
        
        return cell
        
    }
}
