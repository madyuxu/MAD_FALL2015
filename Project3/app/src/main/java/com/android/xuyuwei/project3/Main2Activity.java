package com.android.xuyuwei.project3;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import org.w3c.dom.Text;

public class Main2Activity extends AppCompatActivity {
    private String superHero;
    private String superHeroURL;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        Intent intent = getIntent();
        superHero = intent.getStringExtra("superHeroName");
        superHeroURL = intent.getStringExtra("superHeroURL");
        System.out.println(superHero);
        System.out.println(superHeroURL);

        TextView messageView = (TextView) findViewById(R.id.heroText);
        messageView.setText("You are " + superHero + " !");
    }

    public void loadWebsite(View view) {
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(superHeroURL));
        startActivity(intent);
    }
}

