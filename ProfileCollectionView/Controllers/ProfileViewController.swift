//
//  ViewController.swift
//  ProfileCollectionView
//
//  Created by Liliana Porto Abdala on 13/12/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let searchController = UISearchController()
    
        @IBOutlet weak var collectionView: UICollectionView!
    private let cellId = "cellId"
    var profiles: [Profile]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Planetas"
        navigationItem.searchController = searchController
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        populateProfiles()
    }
    
    func populateProfiles(){
        let profile1 = Profile()
        profile1.name = "Terra"
        profile1.desc = "A terra é um dos quatro planetas rochosos que compõem o Sistema Solar, localizado na Via Láctea. Sua superfície sólida é formada por rochas e metais pesados, como o ferro."
        profile1.image = "terraimg"
        
        
        let profile2 = Profile()
        profile2.name = "Júpiter"
        profile2.desc = "Júpiter é considerado o maior planeta do Sistema Solar. É o quinto na ordem dos planetas tendo-se o Sol como a referência, estando situado entre Marte e Saturno."
        profile2.image = "jupiterimg"
        
        let profile3 = Profile()
        profile3.name = "Saturno"
        profile3.desc = "Saturno possui 9 vezes o tamanho do planeta Terra e é formado principalmente por gases, é o segundo maior planeta do Sistema Solar, ficando atrás apenas de Júpiter."
        profile3.image = "saturnoimg"
        
        let profile4 = Profile()
        profile4.name = "Mercúrio"
        profile4.desc = "Mercúrio é o planeta mais próximo ao Sol e o oitavo em tamanho no sistema solar. A distância média é de 57,9 milhões de quilômetros do Sol."
        profile4.image = "mercurioimg"
        
        
        let profile5 = Profile()
        profile5.name = "Vênus"
        profile5.desc = "Vênus é o planeta com maior proximidade com a Terra, sua superfície composta de dióxido de carbono e ácido sulfúrico, os quais formam nuvens densas responsáveis pelo fenômeno de efeito estufa."
        profile5.image = "venusimg"
        
        
        let profile6 = Profile()
        profile6.name = "Marte"
        profile6.desc = "Marte esta 227 milhões de km do Sol, é um planeta formado por superfície rochosa e atmosfera rica em CO2. Em função de sua coloração, é chamado também de Planeta Vermelho."
        profile6.image = "marteimg"
        
        
        let profile7 = Profile()
        profile7.name = "Urano"
        profile7.desc = "Urano dispõe de um sistema de anéis e é formado principalmente por gases e líquidos. O planeta Urano é o terceiro maior do Sistema Solar e está posicionado na sétima órbita a partir do Sol."
        profile7.image = "uranoimg"
        
        
        let profile8 = Profile()
        profile8.name = "Netuno"
        profile8.desc = "Netuno dispõe de coloração azulada e é formado essencialmente por gases, como o metano. Netuno é o planeta pertencente ao Sistema Solar mais distante do Sol."
        profile8.image = "netunoimg"
        
        
        
        profiles = [profile1, profile2, profile3, profile4, profile5, profile6, profile7, profile8]
        
        
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = profiles?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProfileCollectionViewCell
        
        if let items = profiles?[indexPath.item] {
            cell.profile = items
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width - 20, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            
            secondViewController.getIndexPath(index: indexPath.row)
            present(secondViewController, animated: true)
        }
        
           // if indexPath.row == 0 {
                //print("Funciona")
            }
        }
    
