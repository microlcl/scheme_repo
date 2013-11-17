package com.eastteam.myprogram.web;

import java.io.IOException;

import org.junit.Test;

public class ThumbnailTest {

	@Test
	public void createThumbnail() throws IOException {
		String picFolder = System.getProperty("user.dir");
		String fileName = picFolder + "/WebContent/plupload/files/mypic2.jpg";
		Thumbnail thum = new Thumbnail(fileName);
		thum.resizeFix(500, 300);
	}

}
