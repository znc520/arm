package cn.mldn.realm.cre;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;

import cn.mldn.util.encrypt.MyPasswordEncrypt;

public class CustomerCredentialsMatcher extends SimpleCredentialsMatcher {
	@Override
	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
		// 取得原始的输入数据信息
		Object tokenCredentials = MyPasswordEncrypt.encryptPassword(super.toString(token.getCredentials())).getBytes();
		// 取得认证数据库中的数据
		Object accountCredentials = super.getCredentials(info) ;
		return super.equals(tokenCredentials, accountCredentials); 
	}
}
