package com.myspring.capstone.fstvl;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class FestivalImage {
	public static void main(String[] args) throws IOException{
		String url = "https://api.visitkorea.or.kr/?#/hubTourSearch";
		Document doc = Jsoup.connect(url).get();
		Elements elements = doc.getElementsByAttributeValue("class", "gallery-list");
	}
			
}
