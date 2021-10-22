//
//  MovieDetailsVC.swift
//  movieDb
//
//  Created by swetha on 10/21/21.
//  Copyright © 2021 swetha. All rights reserved.

import UIKit

class MovieDetailsVC: UIViewController {
    
    @IBOutlet weak var labelMovieName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var movieInfo : MoviesModel.Results?
    
    let moviesViewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateData()
    }
    
    func updateData() {
        labelMovieName.text = movieInfo?.originalTitle
        let releaseDate = moviesViewModel.convertDateToProperDateFormat(date: "\(movieInfo?.releaseDate ?? "")", dateFormat: dateFormatYearMonthDate, convertDateFormat: dateFormat)
        labelDate.text = "Release Date: \(releaseDate)"
        labelInfo.text = movieInfo?.overview
        let url = URL(string: "\(imageEndPointURL)\(movieInfo?.posterPath ?? "")")
        if let urlImage = url {
            imageView.kf.setImage(with: urlImage)
        } else {
            imageView.image = UIImage(named: "place_holder")
        }
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
