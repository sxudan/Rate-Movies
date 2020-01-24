//
//  RatePopupController.swift
//  Rate Movies
//
//  Created by Sudan Suwal on 1/24/20.
//  Copyright © 2020 Sudan Suwal. All rights reserved.
//

import UIKit
protocol RatePopupDelegate {
    func onRated(index:Int,rating:Int)
    
}
class RatePopupController: UIViewController {
    var index:Int!
    @IBOutlet weak var rateLabel: UILabel!
    var delegate: RatePopupDelegate!
    var ratingValue = 0
    @IBOutlet weak var ratingSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rateLabel.text = String(ratingValue)
        ratingSlider.value = Float(ratingValue)

    }
    @IBAction func onSliderChanged(_ sender: Any) {
        let val = Int(ratingSlider.value)
        rateLabel.text = String(val)
    }
    
    @IBAction func onOkay(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        delegate.onRated(index: index, rating: Int(ratingSlider.value))
        
    }
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    


}
