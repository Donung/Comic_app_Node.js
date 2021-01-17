package com.jirawat.androidcomicreader.Common;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkInfo;

import com.jirawat.androidcomicreader.Model.Category;
import com.jirawat.androidcomicreader.Model.Chapter;
import com.jirawat.androidcomicreader.Model.Comic;
import com.jirawat.androidcomicreader.Retrofit.IComicAPI;
import com.jirawat.androidcomicreader.Retrofit.RetrofitClient;

import java.util.ArrayList;
import java.util.List;

public class Common {

    public static Comic selected_comic;
    public static Chapter selected_chapter;
    public static int chaper_index = -1;
    public static List<Chapter> chapterList = new ArrayList<>();
    public static List<Category> categorues = new ArrayList<>();

    public static IComicAPI getAPI() {
        return RetrofitClient.getInstance().create(IComicAPI.class);
    }

    public static String formatString(String name) {
        //If character is too long, just substring
        StringBuilder finalResult = new StringBuilder(name.length() > 15 ? name.substring(0, 15)+"...":name);
        return finalResult.toString();
    }

    public static boolean isConnectedToInternet(Context baseContext) {
        ConnectivityManager connectivityManager = (ConnectivityManager) baseContext.getSystemService(Context.CONNECTIVITY_SERVICE);
        if (connectivityManager != null) {
            NetworkInfo[] info = connectivityManager.getAllNetworkInfo();
            if (info != null) {
                for (int i = 0; i < info.length; i++) {
                    if (info[i].getState() == NetworkInfo.State.CONNECTED)
                        return true;
                }
            }
        }
        return false;
    }
}
