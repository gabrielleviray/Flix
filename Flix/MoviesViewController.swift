//
//  ViewController.swift
//  Flix
//
//  Created by Gabrielle Viray on 8/28/20.
//  Copyright © 2020 gabrielleviray. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    // PROPERTIES: available for the lifetime of screen
    var movies_data = [[String:Any]]() // create array of dictionaries
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
        print("Hello")
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

              self.movies_data = dataDictionary["results"] as! [[String:Any]]// Access key inside dictionary
              self.tableView.reloadData()
              print(dataDictionary)
            
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies_data.count
    }
    
    // Called 50 times
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let movie_data = movies_data[indexPath.row] // Store movies
        let movie_title = movie_data["title"] as! String // Need to cast
        
        
        cell.textLabel!.text = movie_title
        
        return cell
    }


}

