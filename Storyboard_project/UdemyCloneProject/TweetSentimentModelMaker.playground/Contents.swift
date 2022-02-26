import Cocoa
import CreateML

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/leewonbeen/Downloads/twitter-sanders-apple3.csv"))

let(trainingData, testingData) = data.randomSplit(by: 0.8,seed: 5)

let sentimentClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")

let evaluationMetrics = sentimentClassifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")

let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

let metadata = MLModelMetadata(author: "leewonbeen", shortDescription: "A model trained to classity sentiment on Tweets", version: "1.0")

try sentimentClassifier.write(to: URL(fileURLWithPath: "/Users/leewonbeen/Downloads/TeetSentimentClassifier.mlmodel"))

try sentimentClassifier.prediction(from: "@Apple is a terrible company!")
try sentimentClassifier.prediction(from: "I just found the best restaurant ever, and it's @DuckanWaffel")

try sentimentClassifier.prediction(from: "I think @CocaCola ads are just ok.")
