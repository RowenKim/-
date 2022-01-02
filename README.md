<hr>
# 게시판 만들기
> 간단한 게시판 만들기(작성, 목록, 수정, 삭제, 페이징처리)

## 사용기술
> Eclipse, JavaSpringBoot, MyBatis, MySQL, BootStrap, HTML/CSS, JavaScript

## 게시판 구성
- 리스트
  - SELECT 쿼리문을 이용하여 DB에 저장되어 있는 게시글 출력
  - 페이징 처리를 JSTL을 이용하여 작업중
- 작성
  - INSERT 쿼리문을 이용하여 DB에 새로운 게시글 정보 입력
- 수정
  - UPDATE 쿼리문을 이용하여 기존에 있는 게시글을 수정
- 삭제 
  - DELETE 쿼리문을 이용하여 기존 게시글을 삭제


## 페이징 처리
> 선택한 페이지와 한 페이지에 나타낼 게시글 수의 값 두개의 Parameter 값을 받아서 처리해주었습니다.

### 시행착오

페이징처리에서 구글링 없이 생각대로 코드를 구현해보았고 돌아가는 길일수도 있었지만 끝까지 완성을 해냈습니다.
기존 페이징처리와는 다르고 효율성이 떨어질수도 있겠지만 우선 스스로 완성한 부분과 생각하면서 성장한 부분이 있었습니다.
더 효율적인 코드를 위해 다른 뛰어난 개발자분들의 코드를 비교하고 더 성장할 수 있는 시간이었습니다.

## 트러블슈팅
<details>
<summary>페이징 처리 1 ~ 10페이지, 11 ~ 20페이지 식으로 따로 출력해주는 부분에서 JSTL을 이용하여 수많은 시도 끝에 완성</summary>
<div markdown="1">
<img width="755" alt="login" src="https://user-images.githubusercontent.com/90335434/147870098-dfcacbbc-c5a5-49d6-ab0c-bd0d0d0b5205.png">
</div>
</details>


<details>
<summary>한 페이지당 출력해주는 게시글 정보의 갯수와 페이지 번호 별에 따른 게시글 정보 출력 정보를 유동적인 코드작성</summary>
<div markdown="1">
<img width="755" alt="login" src="https://user-images.githubusercontent.com/90335434/147870145-e061e312-810f-41c8-bcfe-c22304650b37.png">
</div>
</details>
<hr>

<b>자세한 코드 설명은 아래 블로그 링크 참고</b>


- https://rowen.tistory.com/6 게시글 목록 만들기
- https://rowen.tistory.com/7 게시글 작성 수정 삭제 
- https://rowen.tistory.com/8 게시글 페이징처리

