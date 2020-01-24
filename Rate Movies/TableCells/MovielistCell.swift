//
//  MovielistCell.swift
//  Rate Movies
//
//  Created by Sudan Suwal on 1/24/20.
//  Copyright © 2020 Sudan Suwal. All rights reserved.
//

import UIKit

protocol MovielistDelegate {
    func onClick(index: Int)
}

class MovielistCell: UITableViewCell {
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    var index:Int!
    
    @IBOutlet weak var rateBtn: UIButton!
    
    var delegate:MovielistDelegate!
    
    
    func setPoster(assetName: String){
        moviePoster.image = UIImage(named: assetName)
        moviePoster.tintColor = .yellow
    }
    
    func setTitle(title: String){
        movieTitle.text = title
    }
    
    func setGenre(genres : [String]){
        
        let genreText = genres.joined(separator: ",")
        movieGenre.text = genreText
    }
    
    func setRateLabel(rating:String){
        rateLabel.text = rating
    }
    
    @IBAction func rateNow(_ sender: Any) {
        delegate.onClick(index: self.index)
    }
    
    func setData(index:Int, data: Movie){
        self.index = index
        setPoster(assetName: data.image)
        setTitle(title : data.title)
        setGenre(genres : data.genre)
        setRateLabel(rating: String(data.rating))
        
        rateBtn.layer.cornerRadius = rateBtn.frame.height/2.0
        rateBtn.clipsToBounds = true
    }
    
}
