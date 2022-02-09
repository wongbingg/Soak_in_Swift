//
//  ViewController.swift
//  Twittermenti
//
//  Created by Angela Yu on 17/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import SwifteriOS
import CoreML
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    
    let tweetCount = 100
    
    let sentimentClassifier = TweetSentimentClassifier()
    
    let swifter = Swifter(consumerKey: "7puLLIMdzbPsOkP3UkLzxPmOw", consumerSecret: "pA8xkI2pNln4YkzKa3t2Bz4JimSz0KIeZXQpv7ckCkZLaHSJd4")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func predictPressed(_ sender: Any) {
        
        fetchTweets()
    }
    // MARK: - fetchTweets
    func fetchTweets() {
        
        if let searchText = textField.text {
            
            swifter.searchTweet(using: searchText, lang: "en", count: tweetCount, tweetMode: .extended ) { (results, metadata) in
                
                var tweets = [TweetSentimentClassifierInput]() //full_text 만 불러온 배열
                
                for i in 0..<self.tweetCount {
                    if let tweet = results[i]["full_text"].string {
                        let tweetForClassification = TweetSentimentClassifierInput(text: tweet)
                        tweets.append(tweetForClassification)
                    }
                }
                
                self.makePrediction(with: tweets)
                
                
                
            } failure: { error in
                print("There was an error with the Twitter API Request, \(error)")
            }
        }
    }
    // MARK: - makePrediction
    func makePrediction(with tweets: [TweetSentimentClassifierInput]){
        
        do{
            let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
            
            var sentimentScore = 0
            
            for pred in predictions {
                let sentiment = pred.label
                
                if sentiment == "Pos" {
                    sentimentScore += 1
                }else if sentiment == "Neg" {
                    sentimentScore -= 1
                }
            }
            
            updateUI(with: sentimentScore)

        } catch {
            print("There was an error with making a prediction \(error)")
        }
    }
    // MARK: - updateUI
    func updateUI(with sentimentScore: Int){
        
        if sentimentScore > 20 {
            self.sentimentLabel.text = "😍" //because sentimentLabel is class level, currently inside the closure => it should self.
        } else if sentimentScore > 10 {
            self.sentimentLabel.text = "😀"
        } else if sentimentScore > 0 {
            self.sentimentLabel.text = "🙂"
        } else if sentimentScore == 0 {
            self.sentimentLabel.text = "😐"
        } else if sentimentScore > -10 {
            self.sentimentLabel.text = "😕"
        } else if sentimentScore > -20 {
            self.sentimentLabel.text = "😡"
        } else {
            self.sentimentLabel.text = "🤮"
        }
    }
}

