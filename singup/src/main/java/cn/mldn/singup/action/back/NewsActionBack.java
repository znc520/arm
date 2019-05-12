package cn.mldn.singup.action.back;

import java.io.File;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.mldn.singup.service.back.INewsServiceBack;
import cn.mldn.singup.vo.Member;
import cn.mldn.singup.vo.News;
import cn.mldn.util.CreateStaticUtil;
import cn.mldn.util.action.AbstractAction;
import cn.mldn.util.encrypt.MyPasswordEncrypt;
import cn.mldn.util.split.SplitPageUtil;
@RequestMapping("/admin/news/*")
@Controller
public class NewsActionBack extends AbstractAction {
	@Resource
  private INewsServiceBack newsServiceBack;
	
	
	@RequestMapping("list")  
	@RequiresUser
	@RequiresRoles("news")
	@RequiresPermissions("news:list")
	public ModelAndView list(HttpServletRequest request){
		SplitPageUtil spu=new SplitPageUtil(request, "title");
		ModelAndView mav=new ModelAndView(super.getValue("back.news.list.page"));
	    Map<String, Object>map=this.newsServiceBack.list(spu.getColumn(), spu.getKeyWord(), spu.getCurrentPage(),spu.getLineSize());
	    super.handleSplit(mav, map.get("newsCount"), "公共标题:title|公告摘要:abs","back.news.list.action",spu);
	    mav.addObject("allNews",map.get("allNews"));//真正需要进行显示的数据的集合
		return mav;
		
	}
	@RequestMapping("listNone")  
	@RequiresUser
	@RequiresRoles("news")  
	@RequiresPermissions("news:list")
	public ModelAndView listNone(HttpServletRequest request){
		SplitPageUtil spu=new SplitPageUtil(request, "title");
		ModelAndView mav=new ModelAndView(super.getValue("back.news.list.page"));
		Map<String, Object>map=this.newsServiceBack.listNone(spu.getColumn(), spu.getKeyWord(), spu.getCurrentPage(),spu.getLineSize());
		super.handleSplit(mav, map.get("newsCount"), "公共标题:title|公告摘要:abs","back.news.listNone.action",spu);
		mav.addObject("allNews",map.get("allNews"));//真正需要进行显示的数据的集合
		return mav;
		
	}
	@RequestMapping("addPre")  
	@RequiresUser
	@RequiresRoles("news")
	@RequiresPermissions("news:add")
	public ModelAndView addPre(){
		ModelAndView mav=new ModelAndView(super.getValue("back.news.add.page"));
		mav.addAllObjects(this.newsServiceBack.addPre());
		return mav;
	}  
	@RequestMapping("checkTitle")  
	@RequiresUser
	@RequiresRoles("news")  
	@RequiresPermissions("news:add")
	public ModelAndView checkTitle(String title,HttpServletResponse response){
		super.print(response, this.newsServiceBack.getByTitle(title)==null);
		return null;
	}  
	@RequestMapping("add")
	@RequiresUser
	@RequiresRoles("news")
	@RequiresPermissions("news:add")
	public ModelAndView add(News vo,MultipartFile pic, HttpServletRequest request){
		ModelAndView mav=new ModelAndView(super.getValue("forward.back.page"));
		if(pic!=null){
		   String fileName=	super.createFileName(pic);//
			vo.setPhoto(fileName); // 保存生成的图片名称
			vo.setMid(super.getMid());//设置进行新闻创建的管理员信息
			if(this.newsServiceBack.add(vo)){
				super.saveFile(pic, fileName, request);//图片保存
				super.setMsgAndUrl(mav, "vo.add.success.msg", "back.news.add.action");
				
			}else{
				super.setMsgAndUrl(mav, "vo.add.failure.msg", "back.news.add.action");
			}
		}
		return mav;
	}
	@RequestMapping("editPre")  
	@RequiresUser
	@RequiresRoles("news")
	@RequiresPermissions("news:edit")
	public ModelAndView editPre(Integer nid){
		ModelAndView mav=new ModelAndView(super.getValue("back.news.edit.page"));
		mav.addAllObjects(this.newsServiceBack.editPre(nid));
		return mav;
	}     
	@RequestMapping("edit")
	@RequiresUser
	@RequiresRoles("news")   
	@RequiresPermissions("news:edit")
	public ModelAndView edit(News vo){
		
		ModelAndView mav=new ModelAndView(super.getValue("forward.back.page"));
		if(this.newsServiceBack.edit(vo)){ 
			super.setMsgAndUrl(mav, "vo.edit.success.msg", "back.news.edit.action");
		}else{
			super.setMsgAndUrl(mav, "vo.edit.failure.msg", "back.news.edit.action");
			
		}
		return mav;
	}
	@RequestMapping("remove")
	@RequiresUser
	@RequiresRoles("news")   
	@RequiresPermissions("news:edit")
	public ModelAndView remove(HttpServletRequest request,HttpServletResponse response){
		
		super.print(response, this.newsServiceBack.remove(super.getBatchIds(request)));
		return null;
	}
	
	@RequestMapping("create")
	@RequiresUser
	@RequiresRoles("news")   
	@RequiresPermissions("news:list")
	public ModelAndView create(HttpServletRequest request,HttpServletResponse response){
		String filePath=request.getServletContext().getRealPath("/") + "WEB-INF"+File.separator +"news.static";
		new CreateStaticUtil<News>().create(new File(filePath), this.newsServiceBack.listByFlag(1, 13, 1));
		super.print(response, true);
		return null;
	}
	
	@Override
	public String getType() {
		// TODO Auto-generated method stub
		return "公告";
	}

	@Override
	public String getFileUploadDir() {
		// TODO Auto-generated method stub
		return "/upload/news/";
	}

}
