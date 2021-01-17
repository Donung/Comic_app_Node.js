package com.jirawat.androidcomicreader;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.jirawat.androidcomicreader.Adapter.MultipleChooseAdapter;
import com.jirawat.androidcomicreader.Adapter.MyComicAdapter;
import com.jirawat.androidcomicreader.Common.Common;
import com.jirawat.androidcomicreader.Model.Category;
import com.jirawat.androidcomicreader.Model.Comic;
import com.jirawat.androidcomicreader.Retrofit.IComicAPI;

import java.util.List;

import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;

public class CategoryFilter extends AppCompatActivity {

    Button btn_filter, btn_search;
    IComicAPI iComicAPI;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    RecyclerView recycler_filter;

    @Override
    protected void onStop() {
        compositeDisposable.clear();
        super.onStop();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_category_filter);
        
        iComicAPI = Common.getAPI();
        
        new Handler().post(new Runnable() {
            @Override
            public void run() {
                fetchCategory();     
            }
        });
        
        //View
        btn_filter = findViewById(R.id.btn_filter);
        btn_filter.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Create Dialog
                showoptionsDialog();
            }
        });
        /*btn_search = findViewById(R.id.btn_search);
        btn_search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showSearchDialog();
            }
        });*/

        recycler_filter = findViewById(R.id.recycler_filter);
        recycler_filter.setHasFixedSize(true);
        recycler_filter.setLayoutManager(new GridLayoutManager(this, 2));
    }

    private void showSearchDialog() {
        AlertDialog.Builder alertDialog = new AlertDialog.Builder(CategoryFilter.this);
        alertDialog.setTitle("Search Comic");

        LayoutInflater inflater = this.getLayoutInflater();
        View search_layout = inflater.inflate(R.layout.dialog_search, null);

        EditText edt_search = search_layout.findViewById(R.id.edt_search);

        alertDialog.setView(search_layout);

        alertDialog.setNegativeButton("CANCEL", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        alertDialog.setPositiveButton("SEARCH", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
               fetchSearchComic(edt_search.getText().toString());
            }
        });
        alertDialog.show();
    }

    private void fetchSearchComic(String search) {
        compositeDisposable.add(iComicAPI.getSearchComic(search)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(new Consumer<List<Comic>>() {
                    @Override
                    public void accept(List<Comic> comics) throws Exception {
                        recycler_filter.setVisibility(View.VISIBLE);
                        recycler_filter.setAdapter(new MyComicAdapter(getBaseContext(), comics));
                    }
                }, new Consumer<Throwable>() {
                    @Override
                    public void accept(Throwable throwable) throws Exception {
                        recycler_filter.setVisibility(View.INVISIBLE);
                        Toast.makeText(CategoryFilter.this, "No comic found", Toast.LENGTH_SHORT).show();
                    }
                }));
    }

    private void showoptionsDialog() {
        AlertDialog.Builder alertDialog = new AlertDialog.Builder(CategoryFilter.this);
        alertDialog.setTitle("Select Category");

        LayoutInflater inflater = this.getLayoutInflater();
        View filter_layout = inflater.inflate(R.layout.dialog_options, null);

        RecyclerView recycler_options = filter_layout.findViewById(R.id.recycler_options);
        recycler_options.setHasFixedSize(true);
        recycler_options.setLayoutManager(new LinearLayoutManager(this));
        MultipleChooseAdapter adapter =  new MultipleChooseAdapter(getBaseContext(), Common.categorues);
        recycler_options.setAdapter(adapter);

        alertDialog.setView(filter_layout);
        alertDialog.setNegativeButton("CANCEL", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        });
        alertDialog.setPositiveButton("FILTER", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                fetchFilterCategory(adapter.getFilterArray());
            }
        });
        alertDialog.show();
    }

    private void fetchFilterCategory(String data) {
        compositeDisposable.add(iComicAPI.getFilteredComic(data)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(new Consumer<List<Comic>>() {
                    @Override
                    public void accept(List<Comic> comics) throws Exception {
                        recycler_filter.setVisibility(View.VISIBLE);
                        recycler_filter.setAdapter(new MyComicAdapter(getBaseContext(), comics));
                    }
                }, new Consumer<Throwable>() {
                    @Override
                    public void accept(Throwable throwable) throws Exception {
                        recycler_filter.setVisibility(View.INVISIBLE);
                        Toast.makeText(CategoryFilter.this, "No comic found", Toast.LENGTH_SHORT).show();
                    }
                }));
    }

    private void fetchCategory() {
        compositeDisposable.add(iComicAPI.getCategoryList()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(new Consumer<List<Category>>() {
                    @Override
                    public void accept(List<Category> categories) throws Exception {
                        Common.categorues = categories;
                    }
                }, new Consumer<Throwable>() {
                    @Override
                    public void accept(Throwable throwable) throws Exception {
                        Toast.makeText(CategoryFilter.this, "Load Categoryes error", Toast.LENGTH_SHORT).show();
                    }
                }));
    }
}