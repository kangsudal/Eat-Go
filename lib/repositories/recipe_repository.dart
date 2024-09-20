/*
Repository: "피자 창고 관리자"
Repository는 창고 관리자라고 생각할 수 있어. 창고에는 다양한 피자 재료가 있고, 그걸 필요에 따라 주방으로 보내주지. 만약 창고에 재료가 없으면 창고 관리자는 외부에서 새 재료를 사 오기도 하고(API 호출), 이미 있는 재료를 주방에 가져다주기도 해(캐시, 로컬 DB).

Repository는 데이터를 어디서 가져올지 결정하는 역할을 해. 데이터가:

API에서 직접 가져와야 하는지(주방에서 피자를 만들지),
이미 캐시에 있는 데이터(창고에 남아 있는 재료)를 쓸 건지,
로컬 데이터베이스에서 가져와야 하는지(창고 안 재고를 쓸 건지).
Repository는 데이터 소스를 추상화해서, **주방(Services)**에 재료를 전달하기 전에 여러 경로를 관리해.

차이를 정리하자면:
Services(주방): 데이터를 실제로 처리하는 곳. 예를 들어, 서버에서 데이터를 가져오거나, API를 호출하는 일을 함.
Repository(창고 관리자): 데이터를 어디서 가져올지 결정하는 중간 관리자. 데이터를 API에서 바로 가져오거나, 캐시나 로컬 데이터베이스에서 가져오는 방법을 결정함.
예를 들어:
손님이 **피자(데이터)**를 주문하면:
**Repository(창고 관리자)**는 먼저 창고에 재료가 있는지 확인하고, 만약 있다면 주방에 재료를 전달해.
만약 창고에 없으면 **Services(주방)**에 요청해서 재료를 새로 준비하거나 외부에서 사 오도록 시켜.
Repository는 데이터의 출처를 관리하는 책임이 있고, Services는 그 데이터를 처리하는 실질적인 작업을 담당해.

 */