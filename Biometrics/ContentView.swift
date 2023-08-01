//
//  ContentView.swift
//  Biometrics
//
//  Created by Kentaro Mihara on 2023/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{
            let size = $0.size
            Home(size: size)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
