//
//  BeverageData.swift
//  StarbucksBeverage
//
//  Created by Ham Seonwoo on 2023/06/27.
//

import SwiftUI

struct StarbucksData: Identifiable {
    var id: UUID = UUID()
    
    let name: String //음료, snack 이름
    let imageName: String // 이미지 가져올 링크
    let detailLink: String // 눌렀을 때
    //가격은 조금만 기다려봐
    let price: Int
    
    let tall: Int = 355
    let grande: Int = 473
    let venti: Int = 591
    
}

let coffeeBeverage: [StarbucksData] = [
    StarbucksData(name: "아이스 아메리카노" , imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[106509]_20210430111852999.jpg", detailLink: "https://www.starbucks.co.kr/menu/drink_view.do?product_cd=106509", price: 4500),
    StarbucksData(name: "아이스 카라멜 마키아또", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[110582]_20210415142706229.jpg", detailLink: "https://www.starbucks.co.kr/menu/drink_view.do?product_cd=110582", price: 5900),
    StarbucksData(name: "바닐라 빈 라떼", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2021/02/[9200000001939]_20210225094313320.jpg", detailLink: "https://www.starbucks.co.kr/menu/drink_view.do?product_cd=9200000001939", price: 7000),
    StarbucksData(name: "말차 크림 프라푸치노", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000002502]_20210426100408183.jpg", detailLink: "https://www.starbucks.co.kr/menu/drink_view.do?product_cd=9200000002502", price: 6300),
    StarbucksData(name: "자바칩 프라푸치노", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[168016]_20210415154152277.jpg", detailLink: "https://www.starbucks.co.kr/menu/drink_view.do?product_cd=168016", price: 6300),
    StarbucksData(name: "클래식 아포카토", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2021/02/[9200000001631]_20210225090916688.jpg", detailLink: "https://www.starbucks.co.kr/menu/drink_view.do?product_cd=9200000001631", price: 7000),
    StarbucksData(name: "스파클링 시트러스 에스프레소", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2021/03/[9200000003506]_20210322093318028.jpg", detailLink: "https://www.starbucks.co.kr/menu/drink_view.do?product_cd=9200000003506", price: 7500)
]

let sandwich: [StarbucksData] = [
    StarbucksData(name: "브렉퍼스트 잉글리쉬 머핀" , imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9300000002435]_20210421164423036.jpg", detailLink: "https://www.starbucks.co.kr/menu/food_view.do?product_cd=9300000002435", price: 4200),
    StarbucksData(name: "치즈 포크 커틀릿 샌드위치", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2022/10/[9300000004311]_20221011124051205.jpg", detailLink: "https://www.starbucks.co.kr/menu/food_view.do?product_cd=9300000004311", price: 6200),
    StarbucksData(name: "햄 & 루꼴라 올리브 샌드위치", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2021/11/[9300000001777]_20211103092722745.jpg", detailLink: "https://www.starbucks.co.kr/menu/food_view.do?product_cd=9300000001777", price: 6200),
    StarbucksData(name: "블루베리 쿠키 치즈 케이크", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2021/09/[9300000001376]_20210906163620731.jpg", detailLink: "https://www.starbucks.co.kr/menu/food_view.do?product_cd=9300000001376", price: 6900),
    StarbucksData(name: "바스크 치즈 케이크", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2023/05/[9300000004485]_20230524125744206.jpg", detailLink: "https://www.starbucks.co.kr/menu/food_view.do?product_cd=9300000004485", price: 7900),
    StarbucksData(name: "당근 현무암 케이크", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9300000001055]_20210421133631946.jpg", detailLink: "https://www.starbucks.co.kr/menu/food_view.do?product_cd=9300000001055", price: 7900),
    StarbucksData(name: "더블 에그 샐러드 밀 박스", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2022/02/[9300000003523]_20220218132118557.jpg", detailLink: "https://www.starbucks.co.kr/menu/food_view.do?product_cd=9300000003523", price: 6200)
]
 
let teaBeverage: [StarbucksData] = [
    StarbucksData(name: "자몽 허니 블랙 티", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000000190]_20210419131723681.jpg", detailLink: "https://www.starbucks.co.kr/menu/drink_view.do?product_cd=9200000000190", price: 4500),
    StarbucksData(name: "아이스 제주 금귤 패션 티", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2023/03/[9200000004558]_20230320090411299.jpg", detailLink: "https://www.starbucks.co.kr/menu/drink_view.do?product_cd=9200000004558", price: 6800),
    StarbucksData(name: "아이스 히비스커스 블렌드 티", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[4004000000069]_20210415143811387.jpg", detailLink: "https://www.starbucks.co.kr/menu/drink_view.do?product_cd=4004000000069", price: 5100),
    StarbucksData(name: "플럼 선셋 유스베리 티", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2023/04/[9200000004564]_20230414131633627.jpg", detailLink: "https://www.starbucks.co.kr/menu/drink_view.do?product_cd=9200000004564", price: 6800),
    StarbucksData(name: "제주 한라봉 말차 블렌디드", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2023/04/[9200000004565]_20230414131720858.jpg", detailLink: "https://www.starbucks.co.kr/menu/drink_view.do?product_cd=9200000004565", price: 7000),
    StarbucksData(name: "말차 티 슈페너", imageName: "https://image.istarbucks.co.kr/upload/store/skuimg/2022/09/[9200000004303]_20220902104721539.jpg", detailLink: "https://www.starbucks.co.kr/menu/drink_view.do?product_cd=9200000004303", price: 5300)
]


