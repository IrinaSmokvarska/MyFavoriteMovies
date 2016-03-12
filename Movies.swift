//
//  Movies.swift
//  MyFavoriteMovies
//
//  Created by Darko Spasovski on 3/12/16.
//  Copyright © 2016 Irina Smokvarska. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movies: NSManagedObject {

    func setMovieImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getMovieImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }
    

}
