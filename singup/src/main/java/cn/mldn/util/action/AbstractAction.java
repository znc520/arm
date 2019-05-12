package cn.mldn.util.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.mldn.util.file.UploadFileUtil;
import cn.mldn.util.split.SplitPageUtil;

public abstract class AbstractAction {
	/**
	 * 进行分页数据传递的相关处理
	 * @param mav 要传递数据的ModelAndView对象
	 * @param allRecorders 总记录数，不同的统计出现的总记录数不同
	 * @param columnData 分页的列表数据，格式：字段标签:列名称|字段标签:列名称|..
	 * @param urlKey 要进行分页处理的url的属性的key信息
	 * @param spu 经过了分页参数接收后的SplitPageUtil类对象
	 */
	public void handleSplit(ModelAndView mav, Object allRecorders, String columnData, String urlKey,
			SplitPageUtil spu) {  
		mav.addObject("allRecorders", allRecorders);
		mav.addObject("columnData", columnData);
		mav.addObject("column", spu.getColumn());
		mav.addObject("url", this.getValue(urlKey));
		mav.addObject("keyWord", spu.getKeyWord());
		mav.addObject("currentPage", spu.getCurrentPage());
		mav.addObject("lineSize", spu.getLineSize());
	}

	/**
	 * 根据指定的参数接收一组数据
	 * @param request
	 * @param param
	 * @return
	 */
	public Set<Integer> getSetByInteger(HttpServletRequest request,String param) {
		Set<Integer> all = new HashSet<Integer>() ;
		String values [] = request.getParameterValues(param) ;
		for (int x = 0 ; x < values.length ; x ++) {
			if (values[x].matches("\\d+")) {
				all.add(Integer.parseInt(values[x])) ;
			}
		}
		return all ;
	} 
	
	/**
	 * 取得当前登录的用户ID数据
	 * @return
	 */
	public String getMid() {
		return SecurityUtils.getSubject().getPrincipal().toString() ;
	} 
	/**
	 * 实现注销操作
	 */
	public void logout() {
		SecurityUtils.getSubject().logout();
	}
	
	/**
	 * 设置跳转后所需要的相关的提示信息以及自动跳转路径的内容
	 * @param mav
	 * @param msgKey
	 * @param urlKey
	 */
	public void setMsgAndUrl(ModelAndView mav,String msgKey,String urlKey) {
		if (this.getType() == null) {
			mav.addObject("msg", this.getValue(msgKey)) ;
		} else {
			mav.addObject("msg", this.getValue(msgKey,this.getType())) ;
		}
		mav.addObject("url", this.getValue(urlKey)) ;
	} 
	
	/**
	 * 专门负责数据的输出，可以输出各种数据，主要用于Ajax处理上
	 * @param response
	 * @param value
	 */
	public void print(HttpServletResponse response,Object value) {
		try {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(value);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 生成图片名称
	 * 
	 * @param photo
	 * @return
	 */
	public String createFileName(MultipartFile photo) {
		if (photo.isEmpty()) { // 没有文件上传
			return "nophoto.png"; // 默认没有文件
		} else { // 需要自己生成一个文件
			return UploadFileUtil.createFileName(photo.getContentType());
		}
	}
	/**
	 * 取得要操作数据的标记
	 * @return
	 */
	public abstract String getType() ;

	/**
	 * 进行文件的保存处理
	 * @param photo
	 */
	public boolean saveFile(MultipartFile photo, String fileName, HttpServletRequest request) { // 保存上传的图片名称
		if (!photo.isEmpty()) {
			String filePath = request.getServletContext().getRealPath(this.getFileUploadDir()) + fileName;
			try {
				return UploadFileUtil.save(photo.getInputStream(), new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
				return false ;
			}
		} else {
			return false ;
		}
	}

	/**
	 * 保存上传文件路径
	 * @return
	 */
	public abstract String getFileUploadDir();

	@Resource
	private MessageSource msgSource; // 表示此对象直接引用配置好的类对象（根据类型匹配）

	/**
	 * 根据指定的key的信息进行资源数据的读取控制
	 * @param msgKey
	 *            表示要读取的资源文件的key的内容
	 * @return 表示资源对应的内容
	 */
	public String getValue(String msgKey, Object... args) {
		return this.msgSource.getMessage(msgKey, args, Locale.getDefault());
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) { // 方法名称自己随便写
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 本方法的处理指的是追加有一个自定义的转换编辑器，如果遇见的操作目标类型为java.util.Date类
		// 则使用定义好的SimpleDateFormat类来进行格式化处理，并且允许此参数的内容为空
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(sdf, true));
	}
	/**主要进行批量的数据处理的时候转换操作，在前端批量删除或更新的时候会传入一个ids的参数
	 * id|id|id...
	 * @param request
	 * @return
	 */
 public Set<Integer>getBatchIds (HttpServletRequest request){
		
		Set<Integer>set=new HashSet<Integer>();
		String ids=request.getParameter("ids");
		String result[]=ids.split("\\|");
		for( int x=0;x<result.length;x++){
			set.add(Integer.parseInt(result[x]));
		}
		return   set;
	}
}
