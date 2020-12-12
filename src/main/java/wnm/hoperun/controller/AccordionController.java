package wnm.hoperun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/accordion")
public class AccordionController {
	
	@RequestMapping("/index")
	public String index(){
		return "accordion/index";
	}
	
	@RequestMapping("/plugin")
	public String plugin(){
		return "accordion/plugin";
	}

}
