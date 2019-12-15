//
//  Wave.swift
//  Shooter
//
//  Created by Alex Lombry on 15/12/2019.
//  Copyright © 2019 Alex Lombry. All rights reserved.
//

import SpriteKit

struct Wave: Codable {
    struct WaveEnemy: Codable {
        let position: Int
        let xOffset: CGFloat
        let moveStraight: Bool
    }
    
    let name: String
    let enemies: [WaveEnemy]
}
