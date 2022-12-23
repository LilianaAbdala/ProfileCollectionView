//
//  ViewController.swift
//  ProfileCollectionView
//
//  Created by Liliana Porto Abdala on 13/12/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let searchController = UISearchController()
    
    lazy var navigationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Navigation", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(navigationSecondViewController), for: .touchUpInside)
        return button
    }()
    
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
        
        profiles { resposta in
            self.profiles = resposta
        }
        
        setButton()
        
    }
    
    func setButton() {
        view.addSubview(navigationButton)
        navigationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        navigationButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100).isActive = true
        navigationButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        navigationButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    @objc func navigationSecondViewController() {
        let secondViewController = SecondViewController()
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    // ? opcional, pode receber valor ou nao, ! obrigatorio receber valor.
    
    func profiles(completion: @escaping([Profile]) -> ()) {
        completion([
            Profile(id: 1, name: "Terra", desc: "A terra é um dos quatro planetas rochosos que compõem o Sistema Solar, localizado na Via Láctea. Sua superfície sólida é formada por rochas e metais pesados, como o ferro.", image: "terraimg"),
            Profile(id: 2, name: "Júpiter", desc: "Júpiter é considerado o maior planeta do Sistema Solar. É o quinto na ordem dos planetas tendo-se o Sol como a referência, estando situado entre Marte e Saturno.", image: "jupiterimg"),
            Profile(id: 3, name: "Saturno", desc: "Saturno possui 9 vezes o tamanho do planeta Terra e é formado principalmente por gases, é o segundo maior planeta do Sistema Solar, ficando atrás apenas de Júpiter.", image: "saturnoimg"),
            Profile(id: 4, name: "Mercúrio", desc: "Mercúrio é o planeta mais próximo ao Sol e o oitavo em tamanho no sistema solar. A distância média é de 57,9 milhões de quilômetros do Sol.", image: "mercurioimg"),
            Profile(id: 5, name: "Vênus", desc: "Vênus é o planeta com maior proximidade com a Terra, sua superfície composta de dióxido de carbono e ácido sulfúrico, os quais formam nuvens densas responsáveis pelo fenômeno de efeito estufa.", image: "venusimg"),
            Profile(id: 6, name: "Marte", desc: "Marte esta 227 milhões de km do Sol, é um planeta formado por superfície rochosa e atmosfera rica em CO2. Em função de sua coloração, é chamado também de Planeta Vermelho.", image: "marteimg"),
            Profile(id: 7, name: "Urano", desc: "Urano dispõe de um sistema de anéis e é formado principalmente por gases e líquidos. O planeta Urano é o terceiro maior do Sistema Solar e está posicionado na sétima órbita a partir do Sol.", image: "uranoimg"),
            Profile(id: 8, name: "Netuno", desc: "Netuno dispõe de coloração azulada e é formado essencialmente por gases, como o metano. Netuno é o planeta pertencente ao Sistema Solar mais distante do Sol.", image: "netunoimg")
        
        ])
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

