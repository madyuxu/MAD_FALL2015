package com.android.xuyuwei.coffee;

/**
 * Created by Xuyuwei on 11/17/2015.
 */
public class CoffeeShop {
    private String coffeeShop;
    private String coffeeShopURL;

private void setCoffeeInfo(String coffeeCrowd){
    switch (coffeeCrowd){
        case"popular":
            coffeeShop="starbucks";
            coffeeShopURL="https://www.starbucks.com";
            break;
        case"college":
            coffeeShop="Buchanans";
            coffeeShopURL="http://www.buchananscoffeepub.com";
            break;
        case"cycling":
            coffeeShop="Amante";
            coffeeShopURL="http://www.amantecoffee.com";
            break;
    }
}
public void setCoffeeShop(String coffeeCrowd){
    setCoffeeInfo(coffeeCrowd);
}
public void setCoffeeShopURL(String coffeeCrowd){
    setCoffeeInfo(coffeeCrowd);
}
public String getCoffeeShop(){
    return coffeeShop;
}
public String getCoffeeShopURL(){
    return coffeeShopURL;
}
}
