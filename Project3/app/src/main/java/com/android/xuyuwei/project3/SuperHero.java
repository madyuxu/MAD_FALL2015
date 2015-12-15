package com.android.xuyuwei.project3;

/**
 * Created by Xuyuwei on 12/12/2015.
 */
public class SuperHero {

    private String superHero;
    private String superHeroURL;

    private void setHeroInfo(String birthMonth){
        switch (birthMonth){
            case "January":
                superHero = "James Bond";
                superHeroURL = "http://www.007.com/";
                break;
            case "February":
                superHero = "Harry Potter";
                superHeroURL = "https://www.warnerbros.co.uk/franchises/harry-potter";
                break;
            case "March":
                superHero = "Ironman";
                superHeroURL = "http://marvel.com/universe/Iron_Man_(Anthony_Stark)";
                break;
            case "April":
                superHero = "Captain Jack Sparrow";
                superHeroURL = "http://pirates.disney.com/jack-sparrow";
                break;
            case "May":
                superHero = "Superman";
                superHeroURL = "http://www.supermanhomepage.com/news.php";
                break;
            case "June":
                superHero = "Indiana Jones";
                superHeroURL = "http://www.indianajones.com/";
                break;
            case "July":
                superHero = "Han Solo";
                superHeroURL = "http://www.starwars.com/databank/han-solo";
                break;
            case "August":
                superHero = "Spiderman";
                superHeroURL = "http://marvel.com/characters/54/spider-man";
                break;
            case "September":
                superHero = "Batman";
                superHeroURL = "http://www.dccomics.com/characters/batman";
                break;
            case "October":
                superHero = "Thor";
                superHeroURL = "http://marvel.com/characters/60/thor";
                break;
            case "November":
                superHero = "Eleventh Doctor";
                superHeroURL = "http://www.doctorwho.tv/50-years/doctors/eleventh-doctor/";
                break;
            case "December":
                superHero = "Sherlock";
                superHeroURL = "http://www.warnerbros.com/sherlock-holmes";
                break;
            default:
                superHero = "none";
                superHeroURL = "https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&es_th=1&ie=UTF-8#q=superheroes&es_th=1";
        }
    }
    public void setSuperHero(String birthMonth){
        setHeroInfo(birthMonth);
    }
    public void setSuperHeroURL(String birthMonth){
        setHeroInfo(birthMonth);
    }
    public String getSuperHero() {
        return superHero;
    }
    public String getSuperHeroURL(){
        return superHeroURL;
    }
}


