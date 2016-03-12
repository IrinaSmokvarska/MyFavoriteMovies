//
//  MovieCell.swift
//  MyFavoriteMovies
//
//  Created by Darko Spasovski on 3/12/16.
//  Copyright © 2016 Irina Smokvarska. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var movieImdbLink: UITextView!
    @IBOutlet weak var movieImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(movie: Movies) {
        movieTitle.text = movie.title
        movieImg.image = movie.getMovieImage()
        movieDesc.text = movie.desc
        movieImdbLink.text = movie.imdbUrl
        
    }

 
}
