package com.lec.spring.domain;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Builder
@Getter
@Setter
public class BoardDTO {   // parameter 를 옮겨줄 변수선언 후 Lombok을 이용하여 코드량을 줄임
	private int uid;
	private String title;
	private String summary;
	private String userId;
	private LocalDateTime b_date;
	
	public BoardDTO(int uid, String title, String summary, String userId, LocalDateTime b_date) {
		super();
		this.uid = uid;
		this.title = title;
		this.summary = summary;
		this.userId = userId;
		this.b_date = b_date;
	}

	public BoardDTO() {
		super();
	}
	
	
}
