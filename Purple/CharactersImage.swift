//
//  CharactersImage.swift
//  Purple
//
//  Created by Work on 25.07.2023.
//

import SwiftUI

final class ImageLoader:ObservableObject{
    
    @Published var image:Image? = nil
    
    func load(fromURLString urlString:String){
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else {return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
            
        }
    }
}


struct ConfigureImage:View{
    var image:Image?
    
    var body: some View{
        image?.resizable() ?? Image("placeholder").resizable()
    }
}


struct CharactersImage:View{
    
    @StateObject var imageLoader = ImageLoader()
    let urlString:String
    
    var body: some View{
        ConfigureImage(image: imageLoader.image).onAppear{
            imageLoader.load(fromURLString: urlString)
        }
        
    }
}
