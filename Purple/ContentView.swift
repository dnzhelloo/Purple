//
//  ContentView.swift
//  Purple
//
//  Created by Work on 25.07.2023.
//

import SwiftUI

struct ContentView: View {
//    @State var character:[Character] = []
    
    var body: some View {
//        ScrollView(.horizontal){
//            HStack{
//                ForEach(character) { data in
//                    CharactersImage(urlString: data.image)
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 120,height: 50)
//                        .cornerRadius(12)
//                }
//            }.onAppear{
//                getData()
//            }
//        }
        Text("you can't hurt me no more ")
    }
    
//    func getData(){
//        let service = CharacterService()
//        service.fetchCharacters(page: 1) { result in
//            switch result{
//
//                case .success(let data):
//                    character.append(contentsOf: data)
//                case .failure(let error):
//                    print(error)
//            }
//        }
//    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
