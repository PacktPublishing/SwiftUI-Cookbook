//
//  ContentView.swift
//  RecipeApp
//
//  Created by giordano scalzo on 05/06/2020.
//  Copyright © 2020 Giordano Scalzo. All rights reserved.
//

import SwiftUI

struct Timings {
    let cooking: Int
    let baking: Int
    let resting: Int
}

struct ContentView: View {
    private let timings = Timings(cooking: 20,
                                baking: 5,
                                resting: 10)

    var body: some View {
        VStack {
            CoverView()
            Divider()
            TimingsView(timings: timings)
            Divider()
            IngredientsView()
            Spacer()
        }
    }
}

struct IngredientsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("recipe.ingredients.title")
                .font(.system(size: 28))
                .fontWeight(.bold)
            Text("recipe.ingredients.servings")
                .fontWeight(.bold)
            Text("recipe.ingredients.ingredient1")
            Text("recipe.ingredients.ingredient2")
            Text("recipe.ingredients.ingredient3")
            Text("recipe.ingredients.ingredient4")
            Text("recipe.ingredients.ingredient5")

        }
    }
}

struct TimingsView: View {
    let timings: Timings

    var body: some View {
        HStack(spacing: 64) {
            VStack {
                Text("recipe.timings.cooking.title")
                    .fontWeight(.bold)
                Text("recipe.timings.cooking.value \(timings.cooking)")
            }
            VStack {
                Text("recipe.timings.baking.title")
                    .fontWeight(.bold)
                Text("recipe.timings.baking.value \(timings.baking)")
            }
            VStack {
                Text("recipe.timings.resting.title")
                    .fontWeight(.bold)
                Text("recipe.timings.resting.value \(timings.resting)")
            }
        }
    }
}

struct CoverView: View {
    var body: some View {
        VStack {
            Text("recipe.cover.name")
                .font(.largeTitle)
            Image("recipe")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                Text("recipe.cover.difficulty.title")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                Text("recipe.cover.difficulty.value")
                    .font(.system(size: 28))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "it", "fr"], id: \.self) { l in
            ContentView()
                .environment(\.locale, .init(identifier: l))
        }
    }
}
