package cn.mldn.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FormDateUtil {
	public static String formatDate(Date date) {
		return new SimpleDateFormat("yyyy-MM-dd").format(date) ;
	}
}
 