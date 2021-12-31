
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
