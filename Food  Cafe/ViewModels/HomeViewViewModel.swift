//
//  HomeViewViewModel.swift
//  Food  Cafe
//
//  Created by Thathsarani Nayanathara  on 1/26/23.
//

import Foundation
import Combine
import FirebaseAuth

final class HomeViewViewModel: ObservableObject {
    
    @Published var user: TwitterUser?
    @Published var error: String?
    @Published var products:[ProductData] = []
//    @Published var tweet:[Tweet] = []
    
    private var subscriptions: Set<AnyCancellable> = []
    
    func retrieveUser() {
        guard let id = Auth.auth().currentUser?.uid else { return }
        DatabaseManager.shared.collectionUsers(retrieve: id)
//            .sink { [weak self] completion in
//                if case .failure(let error) = completion {
//                    self?.error = error.localizedDescription
//                }
//
//            } receiveValue: { [weak self] user in
//                self?.user = user
//            }
//            .store(in: &subscriptions)
        self.fetchFood()
   }
    
    func fetchFood(){
            DatabaseManager.shared.collectionFood()
                .sink{ [weak self] completion in
                    if case .failure(let error) = completion {
                        self?.error = error.localizedDescription
                    }
                } receiveValue: { [weak self] retreivedTweets in
                    self?.products = retreivedTweets
                }
                .store(in: &subscriptions)
        }
}
