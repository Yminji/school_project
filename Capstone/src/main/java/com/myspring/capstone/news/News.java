package com.myspring.capstone.news;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class News {

	public static void main(String[] args) throws IOException{
		
		int page = 3;
		
		for(int j = 0; j < page; j++) {
			String url = "https://news.naver.com/main/list.naver?mode=LS2D&sid2=237&sid1=103&mid=shm&date=20230119&page="+j; 
			Document doc = Jsoup.connect(url).get(); //Jsoup에 있는 connect 메소드를 호출하는데 파라미터로 주소 url의 전체 내용을 가져와 document에 저장
			Elements elements = doc.getElementsByAttributeValue("class", "list_body newsflash_body"); //class에 해당하는 값을 가지는 모든 tag를 받아야 됨
			
			Element element = elements.get(0); //Elements는 여러개라는 전제이기 때문에 elements에 데이터가 하나만 달라고 요청, (첫번쨰 거 요청)
			Elements photoElements = element.getElementsByAttributeValue("class", "photo");
			
			for(int i = 0; i < photoElements.size(); i++) {
				Element articleElement = photoElements.get(i); //photoElements에 해당하는 기사 하나씩 가져옴
				Elements aElements = articleElement.select("a"); //a 태그를 가져옴
				Element aElement = aElements.get(0);
				
		
				String articleUrl = aElement.attr("href"); //attr에 원하는 속성의 키를 넣으면 값을 줌 -> 기사 링크
					
				Element imgElement = aElement.select("img").get(0); //img 태그에 해당하는 하나 가져옴
				String imgUrl = imgElement.attr("src"); //이미지 url
				String title = imgElement.attr("alt"); //기사 제목
				
				System.out.println(articleUrl);
				System.out.println(imgUrl);
				System.out.println(title);
				
				/* 기사 내용
				Document subDoc = Jsoup.connect(articleUrl).get();
				Element contentElement = subDoc.getElementById("dic_area"); //기사 내용에 포함된 id
				String content = contentElement.text(); //text() 태그 안에 값만 나옴 -> <br>이란 거 없이 기사 내용만 나옴
				System.out.println(contentElement.text());
				 */
			}
			
			System.out.println(j+1 + "page 크롤링 종료");
			System.out.println();
		}
	}
}
