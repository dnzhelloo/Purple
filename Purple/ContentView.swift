//
//  ContentView.swift
//  Purple
//
//  Created by Work on 25.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CharactersListViewModel()
    
    var body: some View {
        ZStack{
            ScrollView(.horizontal){
                HStack{
                    ForEach(viewModel.character) { data in
                        CharactersImage(urlString: data.image)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120,height: 50)
                            .cornerRadius(12)
                    }
                }.onAppear{
                    viewModel.loadCharacters()
                }
            }
            
            //loading
            if viewModel.isLoading{
                LoadingView()
                
            }
            
        }
        Text("you can't hurt me no more ")
       
    }
    

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
