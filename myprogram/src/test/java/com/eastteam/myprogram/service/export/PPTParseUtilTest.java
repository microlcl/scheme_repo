package com.eastteam.myprogram.service.export;
import java.awt.Color;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.hslf.model.AutoShape;
import org.apache.poi.hslf.model.Fill;
import org.apache.poi.hslf.model.Freeform;
import org.apache.poi.hslf.model.HeadersFooters;
import org.apache.poi.hslf.model.Hyperlink;
import org.apache.poi.hslf.model.Line;
import org.apache.poi.hslf.model.Picture;
import org.apache.poi.hslf.model.Shape;
import org.apache.poi.hslf.model.ShapeTypes;
import org.apache.poi.hslf.model.Slide;
import org.apache.poi.hslf.model.SlideMaster;
import org.apache.poi.hslf.model.Table;
import org.apache.poi.hslf.model.TableCell;
import org.apache.poi.hslf.model.TextBox;
import org.apache.poi.hslf.model.TextRun;
import org.apache.poi.hslf.usermodel.PictureData;
import org.apache.poi.hslf.usermodel.RichTextRun;
import org.apache.poi.hslf.usermodel.SlideShow;
import org.apache.poi.hslf.usermodel.SoundData;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PPTParseUtilTest{
	
//	public static final String PPT_FILE_NAME="C:/10_myproject/tmp/slideshow.ppt";
//	public static final String picFile="C:/10_myproject/tmp/clock.png";
	private static Logger logger = LoggerFactory.getLogger(PPTParseUtilTest.class);
	
	@Test
	public void testPPT() throws IOException {
		String rootFolder = System.getProperty("user.dir");
		String pptFile = rootFolder + "/WebContent/plupload/slideshow.ppt";
		String picFile = rootFolder + "/WebContent/plupload/files/large/" + "bp1.jpg";
		
		SlideShow ppt = new SlideShow();

		// 设置标题,底部信息
		// presentation-scope headers / footers
		HeadersFooters hdd = ppt.getSlideHeadersFooters();
		hdd.setSlideNumberVisible(true);
		hdd.setFootersText("Created by POI-HSLF");

		// add first slide
		Slide s1 = ppt.createSlide();

		// add second slide
		Slide s2 = ppt.createSlide();
		// retrieve page size. Coordinates are expressed in points (72 dpi)
		java.awt.Dimension pgsize = ppt.getPageSize();
		int pgx = pgsize.width; // slide width
		int pgy = pgsize.height; // slide height

		// set new page size
		ppt.setPageSize(new java.awt.Dimension(1024, 768));
		// save changes
		FileOutputStream out = new FileOutputStream(pptFile);

		// get slides
		Slide[] slide = ppt.getSlides();
		for (int i = 0; i < slide.length; i++) {
			Shape[] sh = slide[i].getShapes();
			for (int j = 0; j < sh.length; j++) {
				// name of the shape
				String name = sh[j].getShapeName();

				// shapes's anchor which defines the position of this shape in
				// the slide
				java.awt.Rectangle anchor = sh[j].getAnchor();

				if (sh[j] instanceof Line) {
					Line line = (Line) sh[j];
					// work with Line
				} else if (sh[j] instanceof AutoShape) {
					AutoShape shape = (AutoShape) sh[j];
					// work with AutoShape
				} else if (sh[j] instanceof TextBox) {
					TextBox shape = (TextBox) sh[j];
					// work with TextBox
				} else if (sh[j] instanceof Picture) {
					Picture shape = (Picture) sh[j];
					// work with Picture
				}
			}
		}

		// Drawing a shape on a slide
		Slide slide2 = ppt.createSlide();

		// set slide title
		TextBox title = slide2.addTitle();
		title.setText("Hello, World!");
		// Line shape
		Line line = new Line();
		line.setAnchor(new java.awt.Rectangle(50, 50, 100, 20));
		line.setLineColor(new Color(0, 128, 0));
		line.setLineStyle(Line.LINE_DOUBLE);
		slide2.addShape(line);

		// TextBox
		TextBox txt = new TextBox();
		txt.setText("Hello, World!");
		txt.setAnchor(new java.awt.Rectangle(300, 100, 300, 50));

		// use RichTextRun to work with the text format
		RichTextRun rt = txt.getTextRun().getRichTextRuns()[0];
		rt.setFontSize(32);
		rt.setFontName("Arial");
		rt.setBold(true);
		rt.setItalic(true);
		rt.setUnderlined(true);
		rt.setFontColor(Color.red);
		rt.setAlignment(TextBox.AlignRight);

		slide2.addShape(txt);

		// create shapes of arbitrary geometry
		java.awt.geom.GeneralPath path = new java.awt.geom.GeneralPath();
		path.moveTo(100, 100);
		path.lineTo(200, 100);
		path.curveTo(50, 45, 134, 22, 78, 133);
		path.curveTo(10, 45, 134, 56, 78, 100);
		path.lineTo(100, 200);
		path.closePath();

		Freeform shape = new Freeform();
		shape.setPath(path);
		slide2.addShape(shape);

		// Autoshape
		// 32-point star
		AutoShape sh1 = new AutoShape(ShapeTypes.Star32);
		sh1.setAnchor(new java.awt.Rectangle(50, 50, 100, 200));
		sh1.setFillColor(Color.red);
		slide2.addShape(sh1);

		// Trapezoid
		AutoShape sh2 = new AutoShape(ShapeTypes.Trapezoid);
		sh2.setAnchor(new java.awt.Rectangle(150, 150, 100, 200));
		sh2.setFillColor(Color.blue);
		slide2.addShape(sh2);

		// work with pictures
		// extract all pictures contained in the presentation
		PictureData[] pdata = ppt.getPictureData();
		for (int ii = 0; ii < pdata.length; ii++) {
			PictureData pict = pdata[ii];

			// picture data
			byte[] data = pict.getData();

			int type = pict.getType();
			String ext;
			switch (type) {
			case Picture.JPEG:
				ext = ".jpg";
				break;
			case Picture.PNG:
				ext = ".png";
				break;
			case Picture.WMF:
				ext = ".wmf";
				break;
			case Picture.EMF:
				ext = ".emf";
				break;
			case Picture.PICT:
				ext = ".pict";
				break;
			default:
				continue;
			}
			FileOutputStream out2 = new FileOutputStream("pict_" + ii + ext);
			out2.write(data);
			out2.close();

		}

		// add a new picture to this slideshow and insert it in a new slide
		int idx = ppt.addPicture(new File(picFile), Picture.JPEG);

		Picture pict = new Picture(idx);

		// set image position in the slide
		pict.setAnchor(new java.awt.Rectangle(100, 100, 300, 200));

		Slide slide3 = ppt.createSlide();
		slide3.addShape(pict);

		// This slide has its own background.
		// Without this line it will use master's background.
		slide3.setFollowMasterBackground(false);
		Fill fill = slide3.getBackground().getFill();
		int idx1 = ppt.addPicture(new File(picFile), Picture.JPEG);
		fill.setFillType(Fill.FILL_PATTERN);
		fill.setPictureData(idx1);

		// create bulleted lists

		TextBox shape1 = new TextBox();
		RichTextRun rt1 = shape1.getTextRun().getRichTextRuns()[0];
		shape1.setText("January\r" + "February\r" + "March\r" + "April");
		rt1.setFontSize(42);
		rt1.setBullet(true);
		rt1.setBulletOffset(0); // bullet offset
		rt1.setTextOffset(50); // text offset (should be greater than bullet
								// offset)
		rt1.setBulletChar('\u263A'); // bullet character
		slide3.addShape(shape1);

		shape1.setAnchor(new java.awt.Rectangle(50, 50, 500, 300)); // position
																	// of the
																	// text box
																	// in the
																	// slide
		slide3.addShape(shape1);

		// now retrieve pictures containes in the first slide and save them on
		// disk
		slide3 = ppt.getSlides()[0];
		Shape[] sh3 = slide3.getShapes();
		for (int i2 = 0; i2 < sh3.length; i2++) {
			if (sh3[i2] instanceof Picture) {
				Picture pict1 = (Picture) sh3[i2];
				PictureData pictData = pict1.getPictureData();
				byte[] data = pictData.getData();
				int type = pictData.getType();
				if (type == Picture.JPEG) {
					FileOutputStream out3 = new FileOutputStream("slide0_" + i2
							+ ".jpg");
					out3.write(data);
					out3.close();
				} else if (type == Picture.PNG) {
					FileOutputStream out4 = new FileOutputStream("slide0_" + i2
							+ ".png");
					out4.write(data);
					out4.close();
				}
			}
		}

		// modify background of a slide master
		SlideMaster master = ppt.getSlidesMasters()[0];

		Fill fill1 = master.getBackground().getFill();
		int idx11 = ppt
				.addPicture(new File(picFile), Picture.JPEG);
		fill1.setFillType(Fill.FILL_PICTURE);
		fill1.setPictureData(idx11);

		// read hyperlinks from a slide show
		Slide[] slide1 = ppt.getSlides();
		for (int j = 0; j < slide1.length; j++) {

			// read hyperlinks from the text runs
			TextRun[] txt1 = slide1[j].getTextRuns();
			if (txt1 == null || txt1.length == 0) {
				continue;
			}
			for (int k = 0; k < txt1.length; k++) {
				String text = txt1[k].getText();
				Hyperlink[] links = txt1[k].getHyperlinks();
				if (links != null)
					for (int l = 0; l < links.length; l++) {
						Hyperlink link = links[l];
						String title1 = link.getTitle();
						String address = link.getAddress();
						String substring = text.substring(link.getStartIndex(),
								link.getEndIndex() - 1); // in ppt end index is
															// inclusive
						System.out.println(title1 + address + substring);
					}
			}

			// in PowerPoint you can assign a hyperlink to a shape without text,
			// for example to a Line object. The code below demonstrates how to
			// read such hyperlinks
			Shape[] sh = slide1[j].getShapes();
			for (int k = 0; k < sh.length; k++) {
				Hyperlink link = sh[k].getHyperlink();
				if (link != null) {
					String title1 = link.getTitle();
					String address = link.getAddress();
					System.out.println(title1 + address);
				}
			}
		}

		// table data
		String[][] data = { { "INPUT FILE", "NUMBER OF RECORDS" },
				{ "Item File", "11,559" }, { "Vendor File", "300" },
				{ "Purchase History File", "10,000" },
				{ "Total # of requisitions", "10,200,038" } };

		// 创建表格
		Slide slide11 = ppt.createSlide();
		// create a table of 5 rows and 2 columns
		Table table = new Table(5, 2);
		for (int i = 0; i < data.length; i++) {
			for (int j = 0; j < data[i].length; j++) {
				TableCell cell = table.getCell(i, j);
				cell.setText(data[i][j]);

				RichTextRun rt11 = cell.getTextRun().getRichTextRuns()[0];
				rt11.setFontName("Arial");
				rt11.setFontSize(10);

				cell.setVerticalAlignment(TextBox.AnchorMiddle);
				cell.setHorizontalAlignment(TextBox.AlignCenter);
			}
		}

		// set table borders
		Line border = table.createBorder();
		border.setLineColor(Color.black);
		border.setLineWidth(1.0);
		table.setAllBorders(border);

		// set width of the 1st column
		table.setColumnWidth(0, 300);
		// set width of the 2nd column
		table.setColumnWidth(1, 150);

		slide11.addShape(table);
		table.moveTo(100, 100);

		// retrieve embedded sounds 获取语音信息
		SoundData[] sound = ppt.getSoundData();
		for (int i = 0; i < sound.length; i++) {
			// save *WAV sounds on disk
			if (sound[i].getSoundType().equals(".WAV")) {
				FileOutputStream out1 = new FileOutputStream(
						sound[i].getSoundName());
				out1.write(sound[i].getData());
				out1.close();
			}
		}

		ppt.write(out);
		out.close();
		logger.info("成功产生PPT文件：{}",pptFile);
		
	}
}
