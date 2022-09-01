import Foundation

//var S: UInt32 = 0
//print(String(S, radix: 2))
//S |= (1<<0) // OR 연산으로 해당 수를 추가 가능
//print(String(S, radix: 2))
//S |= (1<<0) // 중복시는 ?
//print(String(S, radix: 2))
//S |= (1<<0) // 중복시는 ?
//print(String(S, radix: 2))
//S |= (1<<0) // 중복시는 ?
//print(String(S, radix: 2))
//S |= (1<<1)
//print(String(S, radix: 2))
//S |= (1<<2)
//print(String(S, radix: 2))
//S |= (1<<5)
//print(String(S, radix: 2))
//
//print("-----------")
//// 해당 자리수를 제거해주는 방법
//S -= S & (1<<0)
//print(String(S, radix: 2))
//S -= S & (1<<0)
//print(String(S, radix: 2)) // 해당 자리에 수가 없으면 무시
//S -= S & (1<<0)
//print(String(S, radix: 2)) // 해당 자리에 수가 없으면 무시
//S -= S & (1<<1)
//print(String(S, radix: 2))
//S |= (1<<1)
//print(String(S, radix: 2))
//S |= (1<<0)
//print(String(S, radix: 2))
//print("-----------")
//// check -> 해당 자리수가 있으면 1 없으면 0 출력
//print(String((S & (1<<0))>>0, radix: 2))
//print(String((S & (1<<1))>>1, radix: 2))
//print(String((S & (1<<2))>>2, radix: 2))
//print(String((S & (1<<3))>>3, radix: 2))
//print(String((S & (1<<4))>>4, radix: 2))
//print(String((S & (1<<5))>>5, radix: 2))
//print(String((S & (1<<6))>>6, radix: 2))
//print(String((S & (1<<7))>>7, radix: 2))
//
//print("-----------")
//// toggle 기존 x값이 있으면 0으로 없으면 1로 바꿔준다 NOT연산
//print(String(S ^ (1<<0), radix: 2))
