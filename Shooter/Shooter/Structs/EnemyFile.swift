//
//  EnemyFile.swift
//  Shooter
//
//  Created by Alex Lombry on 15/12/2019.
//  Copyright © 2019 Alex Lombry. All rights reserved.
//

import SpriteKit

struct EnemyType: Codable {
    let name: String
    let shields: Int
    let speed: CGFloat
    let powerUpChance: Int
}
