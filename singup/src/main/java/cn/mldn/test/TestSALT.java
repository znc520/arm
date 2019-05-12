package cn.mldn.test;

import java.util.Base64;

public class TestSALT {
	public static void main(String[] args) {
		System.out.println(Base64.getEncoder().encodeToString("mldnjava".getBytes()));
	}
}
