//
//  SwiftDataIndex.swift
//  swiftuiutility
//
//  Created by ke Liu on 9/7/25.
//
import SwiftData
import Foundation

@Model
final class Item {
  #Index<Item>([\.name], [\.timestamp], [\.name, \.timestamp])
    
  var name: String
  var timestamp: Date

  init(name: String, timestamp: Date) {
    self.name = name
    self.timestamp = timestamp
  }
}
