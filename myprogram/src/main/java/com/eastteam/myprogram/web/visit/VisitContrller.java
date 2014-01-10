/**
 * 
 */
package com.eastteam.myprogram.web.visit;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author LSS
 *
 */

@Controller
@RequestMapping(value = "/visit")
public class VisitContrller {
	
	@Autowired
  	@Qualifier("configProperties")
  	private Properties configProperties;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(String id, Model model) {

		return "visit/list";
	}

}
