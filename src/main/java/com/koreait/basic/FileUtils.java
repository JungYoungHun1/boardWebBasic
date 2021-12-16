package com.koreait.basic;

import java.io.File;

public class FileUtils {
    //폴더 삭제
    public static void delFolder(String path){
        delFolderFiles(path, true);
    }
    //폴더 아래 파일만 삭제
    public static void delFolderFiles(String path, boolean isDelFolder){
        File folder = new File(path);
        if(folder.exists() && folder.isDirectory()){
            File[] fileList = folder.listFiles();
            if(fileList == null || fileList.length == 0){return;}
            for(File f : fileList){
                if(f.isDirectory()){
                    delFolderFiles(f.getPath(), true);
                }else{
                    f.delete();
                }
            }
        }
        if(isDelFolder){folder.delete();}
    }
}
