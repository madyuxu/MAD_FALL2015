package com.android.xuyuwei.lab9;

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

    public void findMood(View view){
        TextView feeling = (TextView)findViewById(R.id.feelingText);
        Spinner moodSpinner = (Spinner)findViewById(R.id.spinner);
        String moodValue = String.valueOf(moodSpinner.getSelectedItem());
        EditText name = (EditText)findViewById(R.id.name_editText);
        String nameValue = name.getText().toString();

        ToggleButton toggle = (ToggleButton)findViewById(R.id.energy_toggle);
        boolean energy = toggle.isChecked();
        String energyString;
        if(energy){
            energyString = " positive";
        }
        else {
            energyString = " negative";
        }

        RadioGroup yoga = (RadioGroup)findViewById(R.id.yoga_type);
        String yogatype;
        int yoga_id = yoga.getCheckedRadioButtonId();
        switch (yoga_id){
            case -1:
                yogatype=" no";
                break;
            case R.id.radioButton1:
                yogatype=" Yin";
            case R.id.radioButton2:
                yogatype=" Bikram";
                break;
                default:
                    yogatype=" no";
        }
        String checkbox_string = "";
        CheckBox check1 = (CheckBox)findViewById(R.id.checkBox1);
        boolean checked1 = check1.isChecked();
        if(checked1){
            checkbox_string += " enlightened";
        }
        CheckBox check2 = (CheckBox)findViewById(R.id.checkBox2);
        boolean checked2 = check2.isChecked();
        if(checked2){
            checkbox_string += " secretive";
        }

        String meditate_string="";
        Switch meditate_switch=(Switch)findViewById(R.id.switch1);
        boolean meditate = meditate_switch.isChecked();
        if(meditate){
            meditate_string = " and meditates";
        }

        feeling.setText(nameValue+ " is a " + energyString + checkbox_string + " person " + " that does " + yogatype + " yoga " + meditate_string);

    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
