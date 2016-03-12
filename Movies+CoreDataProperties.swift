//
//  Movies+CoreDataProperties.swift
//  MyFavoriteMovies
//
//  Created by Darko Spasovski on 3/12/16.
//  Copyright © 2016 Irina Smokvarska. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movies {

    @NSManaged var image: NSData?
    @NSManaged var title: String?
    @NSManaged var desc: String?
    @NSManaged var imdbUrl: String?
    @NSManaged var imdbPlotDesc: String?

}
