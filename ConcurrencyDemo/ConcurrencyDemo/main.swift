//
//  main.swift
//  ConcurrencyDemo
//
//  Created by 이원빈 on 2022/12/25.
//

import Foundation


// MARK: - Asynchronous Sequences

//let handle = FileHandle.standardInput
//for try await line in handle.bytes.lines {
//    print(line)
//}

// MARK: - Calling Asynchronous Functions in Parallel
func background(_ num: Int) async throws -> String {
    print("백그라운드작업 \(num) 시작")
    try await Task.sleep(nanoseconds: 5000000000)
    print("백그라운드작업 \(num) 완료!")
    return "sum"
}

func anotherAsync(_ num: Int) async throws -> Int {
    print("다른 비동기코드\(num) 시작")
    try await Task.sleep(nanoseconds: 3000000000)
    print("다른 비동기코드 \(num) 완료!")
    return 3
}

func listPhotos(_ num: Int) async throws -> [String] {
    print("네트워킹 \(num) 작업 시작")
    try await Task.sleep(nanoseconds: 3000000000)
    print("네트워킹 \(num) 완료!")
    return ["1", "2", "3"]
}
//async let background1 = background(1)
async let result = listPhotos(1)
async let result2 = listPhotos(2)
async let result3 = listPhotos(3)

Task {
    let another = try await anotherAsync(1) // -> 여기서 멈춰있는 동안 위의 비동기 작업들이 실행될 기회를 얻는다
    print(another)
    print("hello print")
    print(another)
    let another2 = try await anotherAsync(another) // -> 여기서 멈춰있는 동안 위의 비동기 작업들이 실행될 기회를 얻는다
    print(another2)
}
print("hello2")
try await Task.sleep(nanoseconds: 6000000000)

