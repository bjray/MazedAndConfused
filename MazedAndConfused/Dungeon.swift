//
//  Dungeon.swift
//  MazedAndConfused
//
//  Created by B.J. Ray on 1/18/16.
//  Copyright © 2016 Just My Org. All rights reserved.
//

import Foundation

public class Dungeon {
  let minRoomWidth: Int
  let minRoomHeight: Int
  let padding: Int
  let mainSegment: DungeonSegment
  
  public init(minRoomWidth: Int, minRoomHeight: Int, paddingBetweenRooms:Int, width: Int, height: Int) {
    self.minRoomWidth = minRoomWidth
    self.minRoomHeight = minRoomHeight
    self.padding = paddingBetweenRooms
    self.mainSegment = DungeonSegment(x: 0, y: 0, width: width, height: height, segmentId: "_")
  }
}