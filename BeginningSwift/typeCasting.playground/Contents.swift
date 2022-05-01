// Type Casting 문서 예시코드

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoed", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astrley")
]
// library의 타입은 [MediaItem] 으로 쉽게 추정된다.
// 배열 안에는 Movie타입과 Song타입이 들어있지만
// 반복문을 돌려서 배열안의 값들의 타입을 확인해보면 MediaItem으로 확인 될 것이다

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie { /// is 오퍼레이터로 인스턴스가 특정 "subclass" 타입 인지 확인해준다 -> Bool
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")


for item in library {
    if let movie = item as? Movie { /// movie가 올지 song이 올지 MediaItem이 올지 확실하지 않기 때문에, as?를 써준다
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

var things: [Any] = []

things.append(0)
things.append(0.0)
things.append(42)
things.append(-1.0)
things.append(3.14159)
things.append("hello") // String 타입
things.append((3.0, 5.0)) // 튜플 (Double, Double) 타입
things.append(Movie(name: "Ghostbuster", director: "Ivan Reitman"))// Movie 타입
things.append({ (name: String) -> String in "Hello, \(name)"}) // 클로져 타입

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x,y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

let optionalNumber: Int? = 3
things.append(optionalNumber)

