//
//  MazeGrid.swift
//  MazedAndConfused
//
//  Created by B.J. Ray on 12/28/15.
//  Copyright © 2015 Just My Org. All rights reserved.
//

import Foundation
import GameplayKit

public class MazeGrid {
  public var rows, columns: Int
  public var grid = Array<Array<MazeCell>>()
  public var randomR:GKRandomDistribution
  public var randomC:GKRandomDistribution
  
  public init(rows: Int, columns: Int) {
    self.rows = rows
    self.columns = columns
    randomR = GKRandomDistribution(lowestValue: 0, highestValue: rows-1)
    randomC = GKRandomDistribution(lowestValue: 0, highestValue: columns-1)
    prepareGrid()
    configureCells()
  }
  
  public func prepareGrid() {
    for row in 0..<rows {
      
      var colArray = [MazeCell]()
      for col in 0..<columns {
        colArray.append(MazeCell(row: row, col: col))
      }
      grid.append(colArray)
    }
  }
  
  public func configureCells() {
    for row in 0..<rows {
      for col in 0..<columns {
        let aCell = grid[row][col]
        let r = aCell.row
        let c = aCell.column
        
        aCell.north = cellAt(r-1, column: c)
        aCell.south = cellAt(r+1, column: c)
        aCell.west = cellAt(r, column: c-1)
        aCell.east = cellAt(r, column: c+1)
      }
    }
  }
  
  public func cellAt(row: Int, column: Int) -> MazeCell? {
    if case 0..<rows = row {
      if case 0..<grid[row].count = column {
        return grid[row][column]
      }
    }
    return nil
  }
  
  public func describe() -> String {
    let base = "---+"
    var output: String = "+"
    for _ in 0..<columns {
      output += base
    }
    output += "\n"
    
    
    eachRow { (aRow) -> Void in
      var top = "|"
      var bottom = "+"
      var eastBoundary: String
      var southBoundary: String
      
      for aCell in aRow {
        let body = "   "
        let corner = "+"
        
        eastBoundary = "|"
        if let eastCell:MazeCell = aCell.east {
          if aCell.isLinkedToCell(eastCell) {
            eastBoundary = " "
          }
        }
        top += body + eastBoundary
        
        
        southBoundary = "---"
        if let southCell:MazeCell = aCell.south {
          if aCell.isLinkedToCell(southCell) {
            southBoundary = "   "
          }
        }
        bottom += southBoundary + corner
      }
      output += top + "\n"
      output += bottom + "\n"
    }
    
    
    return output
  }
  
  public func randomCell() -> MazeCell {
    let r = randomR.nextInt()
    let c = randomC.nextInt()
    return cellAt(r, column: c)!
  }
  
  public func size() -> Int {
    return rows * columns
  }
  
  public func eachRow(operation: (Array<MazeCell>)->Void) -> Void {
    for aRow in grid {
      operation(aRow)
      
    }
  }
  
  public func eachCell(operation:(MazeCell) ->Void) ->Void {
    eachRow { (row) -> Void in
      for aCell in row {
        operation(aCell)
      }
    }
  }
}