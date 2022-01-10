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
    var userData = RegisterUser()
    var takeImageUser: UIImage?
    var presenter = ProfilePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        prepareTable()
        prepareCollection()
        prepareActionsImage()
        validateImageProfile()
    }
    
    func validateImageProfile(){
        guard let dataUser = userData.imageProfile else {
            return
        }
        selectedProfileUser.isHidden = true
        imageUser.image = UIImage(data: dataUser)
    }
    
    func prepareUI(){
        prepareNavBar(title: "Perfil")
        dataUSerTableView.isHidden = !showDataProfile
        imageUser.makeRounded()
        nameUser.text = userData.name
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
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.cameraDevice = .front
        picker.cameraCaptureMode = .photo
        picker.delegate = self
        picker.modalPresentationStyle = .formSheet
        present(picker, animated: true)
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
    
    func chargeData(data: RegisterUser){
        userData = data
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellData = tableView.dequeueReusableCell(withIdentifier: DataUSerTableViewCell.identifier, for: indexPath) as? DataUSerTableViewCell else { return UITableViewCell() }
        cellData.prepareData(data: userData)
        cellData.selectionStyle = .none
        cellData.delegate = self
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

extension ProfileViewController: DataUSerTableViewCellDelegate {
    func closeSession() {
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        let dataImage = image.pngData()
        selectedProfileUser.isHidden = true
        self.presenter.updateImageUser(image: dataImage, email: userData.email)
        takeImageUser = image
        imageUser.image = takeImageUser
    }
}
