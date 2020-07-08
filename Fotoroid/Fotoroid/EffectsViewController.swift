//
//  EffectsViewController.swift
//  Fotoroid
//
//  Created by Luiz Guilherme on 07/07/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import UIKit

class EffectsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viLoading: UIView!
    @IBOutlet weak var ivPhoto: UIImageView!
    
    var image: UIImage!
    lazy var filterManager: FilterManager = {
        let filterManager = FilterManager(image: image)
        return filterManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivPhoto.image = image

       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ivPhoto.image = filterManager.applyFiltter(type: FilterType(rawValue: 0)!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
