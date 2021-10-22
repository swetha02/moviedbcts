//
//  MovieCell.swift
//  movieDb
//
//  Created by swetha on 10/21/21.
//  Copyright © 2021 swetha. All rights reserved.

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    @IBOutlet weak var imageMoviePoster: UIImageView!
    @IBOutlet weak var labelMovieName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func set(viewModel: MoviesModel.Results?) {
        labelMovieName.text = viewModel?.originalTitle
        labelDate.text = self.convertDateToProperDateFormat(date: "\(viewModel?.releaseDate ?? "")", dateFormat: dateFormatYearMonthDate, convertDateFormat: dateFormatMonthNameDateYear)
        labelRating.text = "\(viewModel?.voteAverage ?? 0.0)"

        let url = URL(string: "\(imageEndPointURL)\(viewModel?.posterPath ?? "")")
        if let urlImage = url {
            imageMoviePoster.kf.setImage(with: urlImage)
        } else {
            imageMoviePoster.image = UIImage(named: "place_holder")
        }
    }

}
