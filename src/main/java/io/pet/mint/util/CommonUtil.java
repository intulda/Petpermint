package io.pet.mint.util;

import java.util.Base64;

// byte -> base64 변환
public class CommonUtil {

	public static String imageToBase64(byte[] byteImage) {
		String base64data = Base64.getEncoder().encodeToString(byteImage);
		return "data:png;base64,"+base64data;
	}
}
