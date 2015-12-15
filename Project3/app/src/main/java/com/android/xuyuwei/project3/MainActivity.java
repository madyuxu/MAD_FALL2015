package com.android.xuyuwei.project3;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Spinner;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
private SuperHero mySuperHero = new SuperHero();

    public void findHero(View view){
        Spinner monthSpinner = (Spinner)findViewById(R.id.spinner);
        String month = String.valueOf(monthSpinner.getSelectedItem());
        mySuperHero.setSuperHero(month);
        String suggestedsuperHero = mySuperHero.getSuperHero();
        String suggestedsuperHeroURL = mySuperHero.getSuperHeroURL();
        System.out.println(suggestedsuperHero);
        System.out.println(suggestedsuperHeroURL);

        Intent intent = new Intent(this,Main2Activity.class);

        intent.putExtra("superHeroName",suggestedsuperHero);
        intent.putExtra("superHeroURL",suggestedsuperHeroURL);

        startActivity(intent);
}
}
