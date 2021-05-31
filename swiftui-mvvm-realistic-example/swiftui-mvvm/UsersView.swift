//
//  UsersView.swift
//  swiftui-mvvm
//
//  Created by Kilo Loco on 12/22/20.
//

import SwiftUI

struct UsersView: View {
    
    @StateObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
        }
        .onAppear(perform: viewModel.getUsers)
    }
}

extension UsersView {
    class ViewModel: ObservableObject {
        @Published var users = [User]()
        
        let dataService: DataService
        
        init(dataService: DataService = AppDataService()) {
            self.dataService = dataService
        }
        
        func getUsers() {
            dataService.getUsers { [weak self] users in
                self?.users = users
            }
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        
        let user = User(id: 0, name: "Preview User")
        let viewModel = UsersView.ViewModel()
        viewModel.users = [user]
        
        return UsersView(viewModel: viewModel)
    }
}
