package cn.mldn.util.encrypt;

import cn.mldn.util.MD5Code;

public class MyPasswordEncrypt {
	private static final String SALT = "bWxkbmphdmE=";
	/** 
	 * 提供有密码的加密处理操作
	 * @param password
	 * @return
	 */
	public static String encryptPassword(String password) {
		return new MD5Code().getMD5ofStr(password + "({"+SALT+"})") ;
	}
}
