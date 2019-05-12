package cn.mldn.singup.service.front;

import cn.mldn.singup.vo.Bespeak;

public interface IBespeakServiceFront {
	/**
	 * 实现预约报名数据的保存 
	 * @param vo
	 * @return
	 */
	public boolean add(Bespeak vo) ;
}
