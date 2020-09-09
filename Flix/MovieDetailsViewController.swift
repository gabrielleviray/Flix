//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Gabrielle Viray on 9/8/20.
//  Copyright © 2020 gabrielleviray. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    
    var movie_details: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = movie_details["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie_details["overview"] as? String
        synopsisLabel.sizeToFit()
        let base_url = "http://image.tmdb.org/t/p/w185"
        let poster_path = movie_details["poster_path"] as! String
            let poster_url = URL(string: base_url + poster_path)
            posterView.af_setImage(withURL: poster_url!)
        
            let backdrop_path = movie_details["backdrop_path"] as! String
                let backdrop_url = URL(string: "http://image.tmdb.org/t/p/w780" + backdrop_path)
                backdropView.af_setImage(withURL: backdrop_url!)
        }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
