//
//  DetailsVC.swift
//  MyFavoriteMovies
//
//  Created by Darko Spasovski on 3/12/16.
//  Copyright © 2016 Irina Smokvarska. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var detailsTitleImg: UIImageView!
    @IBOutlet weak var myDetailsDesc: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    
    var movie: Movies!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.detailsImage.image = movie.getMovieImage()
        
        let imageName = movie.title!.stringByReplacingOccurrencesOfString(" ", withString: "")
        
        if let image: UIImage = UIImage(named: imageName){
            self.detailsTitleImg.image = image
        }else{
            self.detailsTitleImg.hidden = true
        }
        self.myDetailsDesc.text = movie.desc
        self.detailsTextView.text = movie.imdbPlotDesc
        
        self.myDetailsDesc.textColor = UIColor.whiteColor();
    
        
    }
    
    
    @IBAction func backDetailsTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
