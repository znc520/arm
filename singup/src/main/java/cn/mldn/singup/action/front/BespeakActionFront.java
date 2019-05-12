package cn.mldn.singup.action.front;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.mldn.singup.service.front.IBespeakServiceFront;
import cn.mldn.singup.vo.Bespeak;  
import cn.mldn.util.action.AbstractAction;
@Controller
@RequestMapping("/bespeak/*")
public class BespeakActionFront extends AbstractAction {
	@Resource
	private IBespeakServiceFront bespeakServiceFront ;
	@RequestMapping("addPre")
	public ModelAndView addPre() {
		ModelAndView mav = new ModelAndView(super.getValue("front.bespeak.add.page")) ;
		return mav ;
	}
	@RequestMapping("add")
	public ModelAndView add(Bespeak vo) {
		ModelAndView mav = new ModelAndView(super.getValue("forward.front.page")) ;
		if (this.bespeakServiceFront.add(vo)) {
			super.setMsgAndUrl(mav, "bespeak.add.success.msg", "front.index.action");
		} else {
			super.setMsgAndUrl(mav, "bespeak.add.failure.msg", "front.index.action");
		}
		return mav ;
	}
	@Override
	public String getType() {
		return null;
	}
	@Override
	public String getFileUploadDir() {
		return null;
	}

}
