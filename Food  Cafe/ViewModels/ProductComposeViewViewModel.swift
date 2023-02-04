//
//  ProductComposeViewViewModel.swift
//  Food  Cafe
//
//  Created by Thathsarani Nayanathara  on 2/3/23.
//

import Foundation
import Combine
import UIKit
import FirebaseAuth
import FirebaseStorage

final class ProductComposeViewViewModel: ObservableObject {
    private var subscriptions: Set<AnyCancellable> = []
    
    @Published var isValidToTweet: Bool = false
    @Published var error: String = ""
    @Published var shouldDismissComposer: Bool = false
    private var user: TwitterUser?
    
    @Published var _tweetContent: String = ""
    @Published var _displayName: String?
    @Published var _sugarCon: String?
    @Published var _saltCon: String?
    @Published var _fatCon: String?
    @Published var _caloriesCon: String?
    @Published var _bio: String?
    @Published var _avatarPath: String?
    @Published var isOnboardingFinished: Bool = false
    @Published var isFormValid: Bool = false
    @Published var imageData: UIImage?

    func validateUserProfileForm() {
        guard let displayName = _displayName,
              displayName.count > 2,
              let bio = _bio,
              bio.count > 2,
              imageData != nil else {
            isFormValid = false
            return
        }
        isFormValid = true
    }
    
    func uploadAvatar() {
        let randomID = UUID().uuidString
        guard let imageData = imageData?.jpegData(compressionQuality: 0.5) else { return }
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        StorageManager.shared.uploadProfilePhoto(with: randomID, image: imageData, metaData: metaData)
            .flatMap({ metaData in
                StorageManager.shared.getDownloadURL(for: metaData.path)
            })
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.error = error.localizedDescription
                case .finished:
                    self?.dispatchProduct()
//                    self?.updateUserData()
                }
            } receiveValue: { [weak self] url in
                self?._avatarPath = url.absoluteString
            }
            .store(in: &subscriptions)
    }
    
    func dispatchProduct() {
//        guard let user = user else { return }
        let products = ProductData(
            displayName: _displayName ?? "",
            sugarCon: _sugarCon ?? "",
            saltCon: _saltCon ?? "",
            fatCon: _fatCon ?? "",
            caloriesCon: _caloriesCon ?? "",
            bio: _bio ?? "",
            avatarPath: _avatarPath ?? "")
        DatabaseManager.shared.collectionProduct(dispatch: products)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [weak self] onboardingState in
                self?.isOnboardingFinished = onboardingState
            }
            .store(in: &subscriptions)
    }
    
}
