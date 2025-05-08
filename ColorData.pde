import java.util.*;
public class ColorData
{
  public  color BLACK ;
  public  color WHITE ;

  ArrayList<Integer> secondaryColors;
  //Array<color> secondaryColors= new ArrayList<int>();
  public ColorData()
  {
    //primary for b
    WHITE= color(255, 255, 255);
    BLACK=color(0, 0, 0);
    
    secondaryColors= new ArrayList<Integer>();// secondary colors 

    secondaryColors.add(#ff9900);//orange
    secondaryColors.add(#cc3399); //purple
    secondaryColors.add(#66ff33);//green
    secondaryColors.add(#cc0000);//red
    secondaryColors.add(#00ccff);//lightblue
    secondaryColors.add(#00ffff);//Aqua
    secondaryColors.add(#c19233);//Brown
    
    
  }
  
  public color GetRandomColor()
  {
   return secondaryColors.get(int(random(0,secondaryColors.size()-1)));
  }
}
