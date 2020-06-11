//
//  Quote.swift
//  Pnesamentos
//
//  Created by Luiz Guilherme on 04/06/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import Foundation

struct Quote: Codable{
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String{
        return " ‟" + quote + "” "
    }
    
    var authorFormatted: String{
        return "- " + author + " -"
    }
}
