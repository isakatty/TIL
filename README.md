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
# 멋사 iOS 과정 0714 과제

---

## 해야할 것
1. **[SelectedListView]** 

    > * 캐릭터를 선택했을때 담아줄 배열이 필요하고, 그 배열을 이용하여 List View를 표현
    >  * modal View에서 좌측 상단엔 취소버튼, 우측 상단엔 확인버튼을 통해 modal view가 내려가게 구성
    > >  * List를 버튼으로 구성했기 때문에, 확인버튼을 누르면 modalView를 내려가게 했음.
    > * 배열에 값이 하나라도 들어온 상태에서만 전체 삭제와 정렬 버튼이 활성화 되도록 만들었음.
    > > * picker 혹은 버튼 + disabled 사용으로 구성

2. **[CharacterListView]** 

    > *선택할 수 있는 캐릭터 ListView를 그려 선택된 값이 배열에 추가될 수 있게 해야함.
    > > * modal View로 구성
    > > * List에 버튼을 넣어 캐릭터 선택할 수 있게 구성
    > > * 이미지는 AsyncImage를 이용하여 URL로 표현

3. **[ContentView]**
    > * tabView로 밑에 tabItem을 만들어 각 캐릭터를 자세하게 보여주는 뷰로 연결
    > > *  List와 NavigationLink를 사용하여 리스트를 눌렀을 때 **[AboutCharacterDetailVeiw]** 자세히 나타낸 뷰로 연결

---

# ❓ 문제가 발생했던 부분 👉🏻 수정한 부분
1. 다중 선택 이후 확인버튼을 누르지 않은 상태에서 취소를 누르면 눌렀던 리스트 전체가 삭제되어야하는데 *하나씩만 삭제되는 현상*
> * 삭제하는 함수가 swipeAction에 사용했던 함수를 그대로 사용했기 때문에 하나씩 삭제되는 것 
> > * 리스트를 눌러서 추가된 것들을 어떻게 빼내서 삭제할지에 대한 함수를 만들지 못함 ⭐️
> > * 그 결과, 다중 선택 기능을 삭제하고 단일 선택이 되도록 버튼으로 구성하여 삭제는 swipeAction을 통해 이루어지게 만들었음.

2. 줄세우기 버튼의 on/off
> * 분명 disabled 메서드를 이용하여 제한을 두었는데, 처음 앱을 실행 하였을 때와 추가된 캐릭터 리스트의 요소들을 모두 삭제하고 줄세우기 버튼을 다시 눌렀을 때 버튼 기능 Off가 들어가는 현상 확인
> > * if문을 이용하여 배열.count <= 0 일때 boolean 값을 false로 만들게 하였는데 다시 눌렀을 때 적용됨. <수정이 필요함> 

> * 위의 문제를 해결하기 위해 배열.count 말고 class에 배열.isEmpty <boolean> 값을 이용하여 사용함
> > * ControlGroup {}.disabled(empty 불리언값)을 통해 사용하였을때, 버튼은 활성화되지만 버튼의 기능이 작동하지 않았음.
> > > * 해결방안 : if문을 이용하여 배열에 값이 있으면 ControlGroup {버튼1,2}가 보이게 구성함 ⭐️


3. 정렬을 위한 변수를 추가하여 Picker 기능으로 여러 정렬을 볼 수 있게 구성을 하면 더 다체로운 구성이었을텐데 아쉬움이 남는 부분
> * 각 캐릭터에 부여한 rank 외에 이름 순으로 정렬할 수 있게 함수를 넣어 추가해줌.

---

## 정렬을 위해 적용한 부분
* 구조체에 Comparable protocol을 채택하고, 타입 메소드를 정의하여 rank값을 비교하여 작은 수가 앞으로 올 수 있게 구성
> * 배열을 for문으로 돌려서 rank값을 비교하여 가장 작은 숫자를 앞으로 빼게 만들어도 가능 ! < 제출 전 추가할 시간이 있다면 추가할 것.>

![Alt text](https://media.discordapp.net/attachments/1124001520443211899/1130856169477525544/image.png?width=2160&height=588)

> * Comparable 프로토콜을 활용하여 이름에 대한 정렬 기준도 마련하여 적용.

---


|1차|2차|3차 - 최종|
|---|---|---|
|![1차](https://github.com/isakatty/TIL/assets/133845468/8426ac84-663b-47e8-873d-edfd5810e6f5)|![2차](https://github.com/isakatty/TIL/assets/133845468/056bf35b-6694-498a-b072-a21584d28036)|![3차](https://github.com/isakatty/TIL/assets/133845468/b93af0f9-83dc-4133-8bce-63821ca96930)|

1차 - 다중선택, 각 캐릭터에 대한 detailView 제작 X

2차 - 하나씩 선택, 각 캐릭터의 detailView 제작 O,

3차 - ① picker로 표현하려고 했던 정렬을 ControlGroup - Button으로 묶어 정렬 버튼을 구성. ② 새로 추가한 버튼이 없다면 정렬 버튼이 보이지 않도록 구성. ③전체취소와 정렬 버튼 모두 하나의 변수로 제어가 되게 함.

