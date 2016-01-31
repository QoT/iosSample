//
//  DataService.swift
//  iosSample
//
//  Created by Peter McKeown on 30/01/2016.
//  Copyright © 2016 Symmetric. All rights reserved.
//

import Foundation


struct Row {
    init(newId : Int){
        id = newId;
    }
    let id : Int
    
}

/*

Sample Usage:

var service = DataService();
print("\(service.getRows())")
print("\(service.getButtons(service.rows[3]))")

*/
class DataService {
    private var buttonStore : [Int : [String]] = Dictionary<Int, [String]>()
    
    private var rows : [Row] = [ Row(newId: 0), Row(newId: 1), Row(newId: 2), Row(newId: 3), Row(newId: 4), Row(newId: 5), Row(newId: 6), Row(newId:7), Row(newId: 8), Row(newId: 9)];
    
    init(){
        buttonStore[0] = ["one", "two", "three", "four", "five", "six"];
        buttonStore[1] = ["one", "two", "three", "four", "five", "six", "seven","eight" , "nine", "ten", "eleven", "twelve", "thirteen"];
        buttonStore[2] = ["one", "two", "three", "four", "five", "six", "seven","eight" , "nine"];
        buttonStore[3] = ["one", "two", "three", "four", "five", "six", "seven"];
        buttonStore[4] = ["one", "two", "three", "four", "five", "six", "seven","eight" , "nine", "ten"];
        buttonStore[5] = ["one", "two"];
        buttonStore[6] = ["one", "two", "three", "four", "five"];
        buttonStore[7] = ["one", "two", "three", "four", "five", "six", "seven","eight" ];
        buttonStore[8] = ["one", "two", "three", "four", "five", "six", "seven","eight" , "nine"];
        buttonStore[9] = ["one", "two", "three", "four", "five", "six", "seven","eight" , "nine"];
    }
    
    func getRows() -> [Row]{
        return rows;
    }
    
    func getButtons(row: Row) -> [String]{
        return buttonStore[row.id]!;
    }
    
}