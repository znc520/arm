package cn.mldn.singup.action.front;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.mldn.util.action.AbstractAction;
@Controller 
public class IndexAction extends AbstractAction {
	@RequestMapping("/index") 
	public ModelAndView index() {
		return new ModelAndView(super.getValue("front.index.page"));
	}
	@RequestMapping("/admin/indexBack")

	public ModelAndView indexBack() {
		return new ModelAndView(super.getValue("shiro.successUrl.page"));
	}
	@RequestMapping("/errorsUrl")
	@RequiresUser  
	public ModelAndView errore() {
		return new ModelAndView(super.getValue("validation.error.pages"));
	}
	@Override
	public String getFileUploadDir() {
		return null;
	}
	@Override
	public String getType() {
		// TODO Auto-generated method stub
		return null;
	}

}
