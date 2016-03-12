//
//  CreateMovieVC.swift
//  MyFavoriteMovies
//
//  Created by Darko Spasovski on 3/12/16.
//  Copyright © 2016 Irina Smokvarska. All rights reserved.
//

import UIKit
import CoreData

class CreateMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var createTitle: UITextField!
    @IBOutlet weak var createDesc: UITextField!
    @IBOutlet weak var createIMDBurl: UITextField!
    @IBOutlet weak var createIMDBplot: UITextField!
    @IBOutlet weak var createImg: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        createImg.layer.cornerRadius = 4.0
        createImg.clipsToBounds = true
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        createImg.image = image
    }


    @IBAction func addImage(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func createMovie(sender: AnyObject) {
        if let title = createTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movies", inManagedObjectContext: context)!
            let movies = Movies(entity: entity, insertIntoManagedObjectContext: context)
            
            movies.title = title
            movies.desc = createDesc.text
            movies.imdbPlotDesc = createIMDBplot.text
            movies.imdbUrl = createIMDBurl.text
            movies.setMovieImage(createImg.image!)
            
            context.insertObject(movies)
            
            do {
                try context.save()
            } catch {
                print("Could not save movie")
            }
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            
        }
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
