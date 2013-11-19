package com.eastteam.myprogram.web;

import java.io.IOException;

import org.junit.Test;

public class ThumbnailTest {

	@Test
	public void createThumbnail() throws IOException {
		String picFolder = System.getProperty("user.dir");
		String largeFolder = picFolder + "/WebContent/plupload/files/large/";
		String[] largefileNames = new String[] {"bp1.jpg","bp2.jpg","bp3.jpg","bp4.jpg","bp5.jpg",
												"bp6.jpg","bp7.jpg","bp8.jpg","bp9.jpg","bp10.jpg",
												"bp11.jpg","bp12.jpg","bp13.jpg"};
		for (String filename : largefileNames) {
			String file = largeFolder + filename;
			Thumbnail thum = new Thumbnail(file);
			thum.resizeFix(100, 100);		
		}

		
	}

}
