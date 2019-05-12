package cn.mldn.util.file;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

/**
 * 进行文件的保存处理
 * @author mldn
 */
public class UploadFileUtil {
	/**
	 * 创建要保存的文件名称
	 * @param mime
	 * @return
	 */
	public static String createFileName(String mime) {	// 需要创建一个文件名称
		String fileName = UUID.randomUUID() + "." + mime.split("/")[1] ;
		return fileName ;
	}
	/**
	 * 进行文件的保存操作
	 * @param srcFile 上传的原始文件数据输入流
	 * @param destFile 要保存的目标文件路径
	 * @return 保存成功返回true，否则返回false
	 */
	public static boolean save(InputStream inputStream, File destFile) {
		boolean flag = false ;
		OutputStream output = null ;
		if (!destFile.getParentFile().exists()) {	// 父路径不存在
			destFile.getParentFile().mkdirs() ;	// 创建父路径
		}
		try {
			output = new FileOutputStream(destFile) ;
			byte data [] = new byte [2048] ;	// 每块数据的保存大小
			int temp = 0 ;	// 保存每次的个数
			while ((temp = inputStream.read(data)) != -1) {
				output.write(data, 0, temp);
			} 
			flag = true ;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				output.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return flag ;
	}
}
