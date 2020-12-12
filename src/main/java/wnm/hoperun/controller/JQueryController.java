package wnm.hoperun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jQuery")
public class JQueryController {

	@RequestMapping("/how2")
	public String index(){
		return "jQuery/how2";
	}
}
