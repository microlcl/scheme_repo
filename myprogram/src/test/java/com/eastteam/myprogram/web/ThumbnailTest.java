package com.eastteam.myprogram.web;

import java.io.IOException;

import org.junit.Test;

public class ThumbnailTest {

	@Test
	public void createThumbnail() throws IOException {
		String picFolder = System.getProperty("user.dir");
		String fileName1 = picFolder + "/WebContent/plupload/files/large/mypic1.jpg";
		Thumbnail thum1 = new Thumbnail(fileName1);
		thum1.resizeFix(100, 100);
		
		String fileName2 = picFolder + "/WebContent/plupload/files/large/mypic2.jpg";
		Thumbnail thum2 = new Thumbnail(fileName2);
		thum2.resizeFix(100, 100);
		
		String fileName3 = picFolder + "/WebContent/plupload/files/large/mypic3.jpg";
		Thumbnail thum3 = new Thumbnail(fileName3);
		thum3.resizeFix(100, 100);
		
		String fileName4 = picFolder + "/WebContent/plupload/files/large/mypic4.jpg";
		Thumbnail thum4 = new Thumbnail(fileName4);
		thum4.resizeFix(100, 100);
	}

}
