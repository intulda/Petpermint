
package io.pet.mint.util;

import java.util.Base64;

// byte -> base64 변환
public class CommonUtil {

	public static String imageToBase64(byte[] byteImage) {
		String base64data = Base64.getEncoder().encodeToString(byteImage);
		return "data:png;base64,"+base64data;
	}

	public static String getSubStr(String _str, int _max){
		int int_byte = 0;;
		String returnStr = "";
		for(int i=0 ; i<_max ; i++) {
			String temp = "";
			temp = ""+_str.charAt(i);
			int_byte = int_byte+temp.getBytes().length;

			if(int_byte<=_max){
				returnStr        = returnStr+temp;
			} else {
				break;
			}
		}
		return returnStr;
	}
}

