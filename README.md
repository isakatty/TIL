# [멋쟁이 사자처럼 iOS 3기] TIL

**그날** 배우고 완성한 실습 과제를 **기록**하고 마크다운 연습, Git에 친해지기 위한 Repo



---

## 1. 23/06/27

+ SwiftUI에서 화면(View) 전환을 위해 Navigation 공부 및 적용

+ ***NavigationStack***을 통해 뷰를 생성해주고 그 내부에서 List와 ***NavigaionLink(destination: , label:)*** 를 사용하여 다른 뷰로 넘어가는 기능을 넣어줌.

  (서브 View를 위한)SwiftUI file을 만들고 ***NavigationLink의 destination에 적용***을 시켜주면 화면 전환 완성.

+ 06/27 실습을 위해 설정한 주제는 " **스타벅스 메뉴**를 메뉴 카테고리와 칵테고리별 음료 종류, 음료의 가격과 이미지를 보여주는 앱" 으로 설정함.

  1. 데이터 모델링만을 위한 파일 생성: 필요한 데이터 구조체로 만들고 배열에 담아 사용

  2. 음료 카테고리가 있는 메인뷰 + 카테고리 속 구체적인 음료를 나타낸 뷰 (3개) + 선택한 음료의 정보를 알려주는 뷰 (3개)로 총 7개의 뷰를 통해 구성

  3. 사진은 aysncImage(url)를 이용하여 나타내었고, 이미지를 선택하면 사파리를 이용하여 스타벅스 음료 정보로 넘어갈 수 있게 구현


![image.jpg1](https://media.discordapp.net/attachments/1108373401556488245/1123641620265439272/image.png?width=554&height=1136) |![image.jpg2](https://media.discordapp.net/attachments/1108373401556488245/1123641771847581836/image.png?width=562&height=1138) | ![image.jpg3](https://media.discordapp.net/attachments/1108373401556488245/1123641855167438981/image.png?width=562&height=1138)
--- | --- | --- |

---

## 2. 23/06/28

+ **서브 뷰**를 만들고 메인뷰에서 호출하는 방식으로 화면 구성

+ 버튼의 기본적인 설정만 담은 서브뷰, 버튼과 숫자를 받는 텍스트 필드 등 화면에 나타낼 요소들을 담은 서브 뷰, 서브 뷰를 호출하여 간결하게 나타낸 메인뷰 총 3개의 파일로 완성

+ 이 실습을 통해 적용하고자 했던 지식

  + 서브 뷰
  + 연산 프로퍼티, 클로저
  + 열거형과 스위치문


![image.jpg1](https://cdn.discordapp.com/attachments/1124001520443211899/1124001543339900928/image.png) |![image.jpg2](https://cdn.discordapp.com/attachments/1124001520443211899/1124001704254382160/image.png) | ![image.jpg3](https://cdn.discordapp.com/attachments/1124001520443211899/1124001814577172560/image.png) 
--- | --- | --- |

+ 아쉬움이 남는 부분

  + 네비게이션을 같이 사용했으면 더 깔끔하게 화면 구성을 할 수 있었을 것 같다
  + 배경을 ZStack을 이용해서 넣으려고 했는데, 전체적으로 틀어지는 상황을 발견. ZStack에 대해 공부해서 관련 내용 추가할 것
  + picker 기능을 사용해서 10만원 30만원 50만원 100만원 단위로 만들어서 넣을 예정



---

## 3. 23/07/05
* 프로퍼티 래퍼에 대해 배우고 값을 바인딩하여 양방향으로 저장, 사용하는 법에 대해 배움

* HStack로 체크박스 버튼 - 텍스트 - 삭제 버튼으로 구성을 했었는데, 리스트 전체가 삭제버튼으로 인식이 되어 swipeActions을 이용하여 삭제 버튼을 스와이핑을 하여 이루어질 수 있게 변경하였다.

* [오늘 배운 것 중 가장 중요한 것]

  * for _ in (range) { //실행문 } 에서 언더바로 표현한 곳은 반복문을 위해 만들어진 상수(let)이기 때문에 이 상수에 접근하여 값을 변경하려고 하면

    ```Cannot use mutating member on immutable value ```
  
    라는 에러를 주게 됨! -> 값을 접근하는 부분에서 20분을 헤맸다 !



* 더 하고 싶은 것

  * 날짜를 표현해주고, 날짜에 맞춰 to do list를 작성할 수 있는 앱을 만들어보고 싶다.

    찾아보니 DatePicker와 DateFormatter를 사용하면 될 것 같다. 조금 더 공부하고 추가해볼 예정

![ToDoList](https://github.com/isakatty/TIL/assets/133845468/eb8f52fc-3209-4300-83cb-e26affb96505)

---