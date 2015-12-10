package com.android.xuyuwei.mad_final;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    public void findPizza(View view) {
        TextView pizza = (TextView) findViewById(R.id.pizza_text);
        Spinner sizeSpinner = (Spinner) findViewById(R.id.spinner);
        String pizzaValue = String.valueOf(sizeSpinner.getSelectedItem());
        EditText name = (EditText) findViewById(R.id.editText);
        String nameValue = name.getText().toString();
        ToggleButton toggle = (ToggleButton) findViewById(R.id.sauce_toggle);
        boolean sauce = toggle.isChecked();
        String sauceString;
        if (sauce) {
            sauceString = "Red";
        } else {
            sauceString = "White";
        }
        RadioGroup crust = (RadioGroup)findViewById(R.id.typeCrust);
        String crustType;
        int crust_id = crust.getCheckedRadioButtonId();
        switch (crust_id) {
            case -1:
                crustType = "no";
            case R.id.radioButton1:
                crustType = "Thin";
            case R.id.radioButton2:
                crustType = "Thick";
                break;
            default:
                crustType = "no";
        }
        String checkbox_string = "";
        CheckBox check1 = (CheckBox) findViewById(R.id.checkBox1);
        boolean checked1 = check1.isChecked();
        if (checked1) {
            checkbox_string += "pepperoni";
        }
        CheckBox check2 = (CheckBox) findViewById(R.id.checkBox2);
        boolean checked2 = check1.isChecked();
        if (checked2) {
            checkbox_string += "mushrooms";
        }

        CheckBox check3 = (CheckBox) findViewById(R.id.checkBox3);
        boolean checked3 = check1.isChecked();
        if (checked3) {
            checkbox_string += "onions";
        }

        CheckBox check4 = (CheckBox) findViewById(R.id.checkBox4);
        boolean checked4 = check1.isChecked();
        if (checked4) {
            checkbox_string += "sausage";
        }
        String glutenFree_string = "";
        Switch glutenFree_switch = (Switch) findViewById(R.id.switch1);
        boolean glutenFree = glutenFree_switch.isChecked();
        if (glutenFree) {
            glutenFree_string = "and gluten-free";
        }
        pizza.setText("The " + nameValue + " is a " + pizzaValue + crustType + glutenFree_string + " pizza with " + sauceString + " sauce and " + checkbox_string);

    }

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}