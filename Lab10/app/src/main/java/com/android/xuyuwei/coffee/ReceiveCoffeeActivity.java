package com.android.xuyuwei.coffee;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import org.w3c.dom.Text;

public class ReceiveCoffeeActivity extends AppCompatActivity {
    private String coffeeShop;
    private String coffeeShopURL;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receive_coffee);

        //get intent
        Intent intent = getIntent();
        coffeeShop = intent.getStringExtra("coffeeShopName");
        coffeeShopURL = intent.getStringExtra("coffeeShopURL");
        System.out.println(coffeeShop);
        System.out.println(coffeeShopURL);
        //update Text view
        TextView messageView = (TextView)findViewById(R.id.coffeeShopTextView);
        messageView.setText("You should check out "+ coffeeShop);
    }
    public void loadWebSite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(coffeeShopURL));
        startActivity(intent);
    }
}
