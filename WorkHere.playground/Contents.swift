import Foundation

// This homework should be fairly simple.
// visit https://github.com/noops-challenge/wordbot to read
// the documentation for wordbot.
//
// Using that documentation, write a playground that does
// the following:
// download 50 words
// decode those 50 words into an array of strings
// print the array of words, but with each word reversed
// print the average number of characters per word

struct wordStruct: Codable {
    let words: [String]
}

let urlString = "https://api.noopschallenge.com/wordbot?count=50"
let session = URLSession(configuration: .ephemeral)
let task = session.dataTask(with: URL(string: urlString)!) {
    (data, response, error) in
    if let data = data {
        let decoder = JSONDecoder()
        let wordArr = try! decoder.decode(wordStruct.self, from: data)
        var newWordArr = [String]()
        var totalLength = 0
        for word in wordArr.words {
            newWordArr.append(String(word.reversed()))
            totalLength += word.count
        }
        let averageLength = totalLength/newWordArr.count
        
        print(newWordArr)
        print(averageLength)
    }
}

task.resume()
