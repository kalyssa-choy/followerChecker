//
//  main.swift
//  followerChecker
//
//  Created by StudentAM on 1/23/24.
//

import Foundation
import CSV

var following: [[String]] = []
var followers: [[String]] = []

var i: Int = 0

print("Welcome to the follower checker! If you intend to use the program with updated data, you must change the csv files.")
/*  1. go to instagram and log in
    2. go to your activity
    3. click download data
    4. choose the specific data and scroll to select followers and following
    5. request the data (could take a bit of time for them to send the data back)
    6. download the data and open the html in text edit (or other software)
    7. delete the titles and make sure it is just the username with/without the dates (you don't have to delete the dates)
    8. make it a csv file
    9. change the pathways in this code
    10. run code
 */

//reading the following csv file and storing the usernames in the following array
do{
    let stream = InputStream(fileAtPath:"/Users/studentam/Desktop/followerChecker/followerChecker/following.csv")
    
    let csv = try CSVReader(stream: stream!)
    
    while let row = csv.next(){
        if row.count == 1 && row[0] != ""{
            following.append(row)
        }
    }
}
catch{
    print("There was an error trying to read the file!")
}

//reading the followers csv file and storing the usernames in the followers array
do{
    let stream = InputStream(fileAtPath:"/Users/studentam/Desktop/followerChecker/followerChecker/followers.csv")
    
    let csv = try CSVReader(stream: stream!)
    
    while let row = csv.next(){
        if row.count == 1 && row[0] != ""{
            followers.append(row)
        }
    }
}
catch{
    print("There was an error trying to read the file!")
}

print("Successfully created an array of both the followers and the following")

print("Here are usernames of the people that don't follow you back:")

var count: Int = 0

//checks if the accounts following match with the followers, and prints the accounts that are in following but not in followers
for i in 0..<following.count{
    if !followers.contains(following[i]){
        print(following[i])
        count += 1
    }
}

//print the number of accounts that you follow, but don't follow you
print("There are \(count) accounts that don't follow you back")
