//
//  ViewController.swift
//  DeliveryHero
//
//  Created by Gabriel Schmit Dall Agnol on 20/07/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit
import DeliveryHeroDomain
import DeliveryHeroData
import UICore

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let form = HeroFetchProfilesForm(limite: 20, deslocamento: 0, pesquisa: "")
        
        DeliveryHeroDomainDI.shared.fetchHeroesUseCase.execute(form: form) { response in
            switch response {
            case .success(let value):
                print(value)
            case.failure(let error):
                print(error)
            }
        }
        
    }


}

