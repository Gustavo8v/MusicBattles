//
//  ProfileViewController.swift
//  MusicBattles
//
//  Created by Gustavo on 08/01/22.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    @IBOutlet weak var dataUSerTableView: UITableView!
    @IBOutlet weak var dataMusicCollectionView: UICollectionView!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var dataUserImage: UIImageView!
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var selectedProfileUser: UILabel!
    
    var showDataProfile = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        prepareTable()
        prepareCollection()
        prepareActionsImage()
    }
    
    func prepareUI(){
        prepareNavBar(title: "Perfil")
        dataUSerTableView.isHidden = !showDataProfile
        imageUser.makeRounded()
    }
    
    func prepareTable(){
        dataUSerTableView.delegate = self
        dataUSerTableView.dataSource = self
        dataUSerTableView.register(UINib(nibName: DataUSerTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DataUSerTableViewCell.identifier)
    }
    
    func prepareActionsImage(){
        dataUserImage.isUserInteractionEnabled = true
        let tapDataUser = UITapGestureRecognizer(target: self, action: #selector(showData))
        musicImage.isUserInteractionEnabled = true
        let tapDataMusic = UITapGestureRecognizer(target: self, action: #selector(showMusic))
        selectedProfileUser.isUserInteractionEnabled = true
        let tapSelectedImage = UITapGestureRecognizer(target: self, action: #selector(selectedImageUser))
        selectedProfileUser.addGestureRecognizer(tapSelectedImage)
        dataUserImage.addGestureRecognizer(tapDataUser)
        musicImage.addGestureRecognizer(tapDataMusic)
    }
    
    @objc func selectedImageUser(){
        print("image")
    }
    
    @objc func showData(){
        showDataProfile = true
        DispatchQueue.main.async {
            self.dataUSerTableView.isHidden = !self.showDataProfile
        }
    }
    
    @objc func showMusic(){
        showDataProfile = false
        DispatchQueue.main.async {
            self.dataUSerTableView.isHidden = !self.showDataProfile
        }
    }
    
    func prepareCollection(){
//        dataMusicCollectionView.delegate = self
//        dataMusicCollectionView.dataSource = self
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellData = tableView.dequeueReusableCell(withIdentifier: DataUSerTableViewCell.identifier, for: indexPath) as? DataUSerTableViewCell else { return UITableViewCell() }
        return cellData
    }
}

//extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//}
