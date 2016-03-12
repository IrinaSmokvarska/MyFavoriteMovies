//
//  ViewController.swift
//  MyFavoriteMovies
//
//  Created by Darko Spasovski on 3/12/16.
//  Copyright © 2016 Irina Smokvarska. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movies]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let entity = NSEntityDescription.entityForName("Movies", inManagedObjectContext: context)!
        let movies = Movies(entity: entity, insertIntoManagedObjectContext: context)
        
        movies.title = "Fight Club"
        movies.desc = "This is more than just a movie, it is a masterpiece!"
        movies.imdbPlotDesc = "An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soap maker, forming an underground fight club that evolves into something much, much more..."
        movies.imdbUrl = "http://www.imdb.com/title/tt0137523/?ref_=nv_sr_1"
        movies.setMovieImage(UIImage(named: "Fight_Club")!)
        
        context.insertObject(movies)
        
        do {
            try context.save()
        } catch {
            print("Could not save movie")
        }

        let movies2 = Movies(entity: entity, insertIntoManagedObjectContext: context)

        
        movies2.title = "Filth"
        movies2.desc = "Movie about human psychologic strenght"
        movies2.imdbPlotDesc = "A corrupt, junkie cop with Borderline Personality Disorder attempts to manipulate his way through a promotion in order to win back his wife and daughter while also fighting his own borderline-fueled inner demons."
        movies2.imdbUrl = "http://www.imdb.com/title/tt1450321/?ref_=nv_sr_1"
        movies2.setMovieImage(UIImage(named: "filth-poster")!)
        
        context.insertObject(movies2)
        
        do {
            try context.save()
        } catch {
            print("Could not save movie")
        }
        
        let movies3 = Movies(entity: entity, insertIntoManagedObjectContext: context)
        
        
        movies3.title = "Law Abiding Citizen"
        movies3.desc = "Movie where you can see how harsh is law corruption"
        movies3.imdbPlotDesc = "A frustrated man decides to take justice into his own hands after a plea bargain sets one of his family's killers free. He targets not only the killer but also the district attorney and others involved in the deal."
        movies3.imdbUrl = "http://www.imdb.com/title/tt1197624/?ref_=nv_sr_1"
        movies3.setMovieImage(UIImage(named: "law-abiding-citizen-2")!)
        
        context.insertObject(movies3)
        
        do {
            try context.save()
        } catch {
            print("Could not save movie")
        }

        
        self.tableView.reloadData()

    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        
        tableView.reloadData()
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movies")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movies]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            return cell
        } else {
            return MovieCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
         let movie = movies[indexPath.row]
        self.performSegueWithIdentifier("detailsSegue", sender: movie)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailsSegue" {
            
            let detailsVC: DetailsVC = segue.destinationViewController as! DetailsVC
            detailsVC.movie = sender as! Movies;
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 161;
    }
}

