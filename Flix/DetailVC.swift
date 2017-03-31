//
//  DetailVC.swift
//  Flix
//
//  Created by Will Gilman on 3/29/17.
//  Copyright © 2017 Will Gilman. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var infoView: UIView!
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height)

        let title = movie["title"] as? String
        titleLabel.text = title
        
        let overview = movie["overview"] as? String
        overviewLabel.text = overview
        
        overviewLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p"
        let smallSize = "/w500"
        let largeSize = "/original"
        if let posterPath = movie["poster_path"] as? String {
            let smallposterRequest = NSURLRequest(url: NSURL(string: baseUrl + smallSize + posterPath) as! URL)
            let largeposterRequest = NSURLRequest(url: NSURL(string: baseUrl + largeSize + posterPath) as! URL)
            posterImageView.setImageWith(
                smallposterRequest as URLRequest,
                placeholderImage: nil,
                success: { (smallposterRequest, smallPosterResponse, smallPoster) -> Void in
                    self.posterImageView.alpha = 0.0
                    self.posterImageView.image = smallPoster
                    UIView.animate(withDuration: 0.3, animations: { () -> Void in
                        self.posterImageView.alpha = 1.0
                    }, completion: { (success) -> Void in
                        self.posterImageView.setImageWith(
                            largeposterRequest as URLRequest,
                            placeholderImage: smallPoster,
                            success: { (largePosterRequest, largePosterResponse, largePoster) -> Void in
                                self.posterImageView.image = largePoster
                            },
                            failure: { (request, response, error) -> Void in
                                print(error)
                            })
                    })
                },
                failure: { (request, response, error) -> Void in
                    print(error)
                })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
