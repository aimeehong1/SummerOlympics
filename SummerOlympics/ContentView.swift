//
//  ContentView.swift
//  SummerOlympics
//
//  Created by Aimee Hong on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var logoNumber = 22
    private let logos = ["1924-Paris-France.jpg",
                 "1932-los-angeles-usa.jpg",
                 "1936-berlin-germany.png",
                 "1948-london-england.jpg",
                 "1952-helsinki-finland.jpg",
                 "1956-melbourne-australia.jpg",
                 "1960-rome-italy.jpg",
                 "1964-tokyo-japan.jpg",
                 "1968-mexico-city-mexico.jpg",
                 "1972-munich-germany.png",
                 "1976-montreal-canada.jpg",
                 "1980-moscow-russia.jpg",
                 "1984-los-angeles-usa.jpg",
                 "1988-seoul-south-korea.jpg",
                 "1992-barcelona-spain.jpg",
                 "1996-atlanta-usa.jpg",
                 "2000-sydney-australia.jpg",
                 "2004-athens-greece.png",
                 "2008-beijing-china.jpg",
                 "2012-london-england.jpg",
                 "2016-rio-brazil.jpg",
                 "2020-toykyo-japan.jpeg",
                 "2024-paris-france.png",
                 "2028-los-angelas-usa.png",
                 "2032-brisbane-australia"]
    var body: some View {
        VStack {
            Text("Olympic Logos")
                .font(.largeTitle)
                .fontWeight(.black)
            
            Spacer()
            
            Image(getImageName(logoName: logos[logoNumber]))
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Group {
                Text("\(getCity(logoString: logos[logoNumber])), \(getCountry(logoString: logos[logoNumber]))")
                Text("\(getYear(element: logos[logoNumber]))")
            }
            .font(.largeTitle)
            .fontWeight(.thin)
            
            HStack {
                Button {
                    logoNumber -= 1
                } label: {
                    Image(systemName: "chevron.left.to.line")
                }
                .tint(.black)
                .disabled(logoNumber == 0)
                
                Spacer()
                
                Button {
                    logoNumber += 1
                } label: {
                    Image(systemName: "chevron.forward.to.line")
                }
                .tint(.black)
                .disabled(logoNumber == logos.count - 1)
            }
            .font(.largeTitle)
            .fontWeight(.black)
        }
        .padding()
    }
    
    func getImageName(logoName: String) -> String {
        var newLogoName = logoName.replacingOccurrences(of: ".png", with: "")
        newLogoName = newLogoName.replacingOccurrences(of: ".jpg", with: "")
        return newLogoName.replacingOccurrences(of: ".jpeg", with: "")
    }

    func getYear(element: String) -> String {
        let componentArray = element.components(separatedBy: "-")
        return componentArray[0]
    }

    func getCountry(logoString: String) -> String {
        let componentArray = logoString.components(separatedBy: "-")
        var country = componentArray.last!
        country = getImageName(logoName: country)
        if country.lowercased() == "usa" {
            return country.uppercased()
        } else if country.lowercased() == "korea"{
            return "\(componentArray[componentArray.count-2]) \(country)".capitalized
        } else {
            return country.capitalized
        }
    }
    
    func getCity(logoString: String) -> String {
        var componentArray = logoString.components(separatedBy: "-")
        componentArray.removeFirst()
        componentArray.removeLast()
        var city = ""
        for component in componentArray {
            city += component + " "
        }
        city.removeLast()
        return city.capitalized
    }
}

#Preview {
    ContentView()
}
