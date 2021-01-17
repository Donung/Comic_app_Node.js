package com.jirawat.androidcomicreader;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.AlertDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.jirawat.androidcomicreader.Adapter.MyChapterAdapter;
import com.jirawat.androidcomicreader.Adapter.MyComicAdapter;
import com.jirawat.androidcomicreader.Common.Common;
import com.jirawat.androidcomicreader.Model.Chapter;
import com.jirawat.androidcomicreader.Retrofit.IComicAPI;

import java.util.List;

import dmax.dialog.SpotsDialog;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;

public class ChapterActivity extends AppCompatActivity {

    IComicAPI iComicAPI;
    RecyclerView recycler_chapter;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    TextView txt_chapter;

    @Override
    protected void onStop() {
        compositeDisposable.clear();
        super.onStop();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chapter);

        //Init API
        iComicAPI = Common.getAPI();

        //View
        Toolbar toolbar = findViewById(R.id.toolbar);
        toolbar.setTitle(Common.selected_comic.getName());

        //Set icon for toolbar
        toolbar.setNavigationIcon(R.drawable.ic_chevron_left_24dp);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish(); // go back
            }
        });

        recycler_chapter = findViewById(R.id.recycler_chapter);
        recycler_chapter.setHasFixedSize(true);
        LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        recycler_chapter.setLayoutManager(layoutManager);
        recycler_chapter.addItemDecoration(new DividerItemDecoration(this, layoutManager.getOrientation()));
        
        txt_chapter = findViewById(R.id.txt_chapter);
        
        fetchChapter(Common.selected_comic.getID());
    }

    private void fetchChapter(int comicId) {
        AlertDialog dialog = new SpotsDialog.Builder().setContext(this).setMessage("Please wait...").setCancelable(false).build();
        dialog.show();

        compositeDisposable.add(iComicAPI.getChapterList(comicId)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(new Consumer<List<Chapter>>() {
                    @Override
                    public void accept(List<Chapter> chapters) throws Exception {
                        Common.chapterList = chapters; // Save chapter to back, next
                        recycler_chapter.setAdapter(new MyChapterAdapter(getBaseContext(), chapters));
                        txt_chapter.setText(new StringBuilder("CHAPTER (")
                        .append(chapters.size())
                        .append(")"));
                        dialog.dismiss();
                    }
                }, new Consumer<Throwable>() {
                    @Override
                    public void accept(Throwable throwable) throws Exception {
                        Toast.makeText(ChapterActivity.this, "Error while loading chapter", Toast.LENGTH_SHORT).show();
                        dialog.dismiss();
                    }
                }));
    }
}