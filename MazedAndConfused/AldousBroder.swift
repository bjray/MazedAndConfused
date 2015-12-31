//
//  AldousBroder.swift
//  MazedAndConfused
//
//  Created by B.J. Ray on 12/28/15.
//  Copyright © 2015 Just My Org. All rights reserved.
//

import Foundation

public class AldousBroder {
  public var maze: MazeGrid
  
  public init(aGrid: MazeGrid) {
    var aCell = aGrid.randomCell()
    var unvisited = aGrid.size() - 1
    
    while unvisited > 0 {
      let neighbor = aCell.neighbors().sample()
      
      if neighbor.links.isEmpty {
        aCell.link(neighbor)
        unvisited -= 1
      }
      aCell = neighbor
    }
    maze = aGrid
  }
}