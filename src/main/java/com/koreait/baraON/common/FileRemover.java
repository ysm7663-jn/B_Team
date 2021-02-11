package com.koreait.baraON.common;

import java.io.File;
import java.util.List;

public class FileRemover {

	public FileRemover(List<String> list, String realPath) {
		int size = list.size();
		for (int i = 0; i<size ; i++) {
			File file = new File(realPath, list.get(i));
			if(file.exists()) {
				file.delete();
			}
		}
	}
}