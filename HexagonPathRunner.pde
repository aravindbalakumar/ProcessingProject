import processing.sound.*; //<>//
//class that generates hexagons and randomly generate path and run along it in curved way using beizer
public class HexagonPathRunner
{
  public ShapeManager parent;// the base hexagon
  ArrayList<ShapeManager> children;// list to contain the rest of the overlaying hexagon
  PVector startPoint;  // start point that gets updated after compeleting a small path
  color pathRunnerColor; //the color is added to all elements to differentiate
 

  public void CreatePathRunners(PVector position, float size)
  {
    if (size<=10) // to stop recursively running after certiain size
    {
      return;
    }
    Hexagon hex= new Hexagon(position, size, 2); // hexa gon shape is created
    if (parent==null) // if the parent is not assigned then this is the first recursive iteration
    {
      pathRunnerColor=project.colorData.GetRandomColor(); // get the random color
      hex.fillColor=pathRunnerColor; 
      hex.Initialize();
      parent= new ShapeManager(hex, 0);// adding the parent reference
      //project.UpdateObjects.add(parent);
      startPoint=position; // updtaing the initial position as the start
      CreatePathRunners(new PVector(0, position.y+size), size*0.835); // first recursive call \
      pathRunnerColor=project.colorData.GetRandomColor();
    } else
    {
      if (children==null)
      {
        children= new ArrayList<ShapeManager>();
      }
      hex.fillColor=pathRunnerColor;
      hex.Initialize();
      ShapeManager child=new ShapeManager(hex, 0);
      children.add(child);
      // the child hexagons are being assigned to follow beind the parent shape with a offset value
      // this value is set in awy to mimic the  as if the the child hexagons are following the parent by a slight delay creating a visual symmetry with the hexagons
      child.Follow(parent.shape, constrain(children.size()*0.25, 0, 1.0)); 
      //project.UpdateObjects.add(child);
      CreatePathRunners(new PVector(hex.position.x+size, hex.position.y+size), size*0.835);
    }
  }

// function that returns a float point value between boun
  public float RandomAxisValueWithinBoundLimit(boolean isXAxis)
  {

    if (isXAxis) {
      return random(MinBounds.x, MaxBounds.x);
    } else
    {
      return random(MinBounds.y, MaxBounds.y);
    }
  }

///called in the update from hexagon motion
  public void MoveAlongThePath()// more like moving along beizer curve cubic where 2 points and a control point is used
  {
    if (!parent.isItMovingOnPath) // checking to avoid frequent path intialization
    {
      PVector p1, cp, p2;
      p1=startPoint;// this is done so that the hexagon moves smoothly
      p2=new PVector(RandomAxisValueWithinBoundLimit(true), RandomAxisValueWithinBoundLimit(false));
      //float cp_x= random(p1.x, p2.x)+random(-150, 150)*noise(millis()); // this was so jaggy
      //float cp_y= random(p1.y, p2.y)+random(-150, 150)*noise(millis());

    
      // the angle is calculated from the perlin noise that takes from the frame rate, to make sure it happens smoothly we are using map
      float angle=map(noise(random(frameRate)), 0, 1, PI, TWO_PI);
      float cosT=cos(angle);
      float sinT=cos(angle);
      
       //using circle formula for create a control point, this is done intentioanlly so that we can get a curved path
       //the cicrle formula used is X= rCos(Theta), y= rSin(theta)
      //except instead of radius we are taking the difference between the 2  points
    
      float cp_x= constrain((p2.x-p1.x)*cosT, 0, project.MaxBounds.x);//  constrained to make sure it does not go beyond the screen
      float cp_y= constrain((p2.y-p1.y)*sinT, 0, project.MaxBounds.y);//  constrained to make sure it does not goe beyond the screen
      cp=new PVector(cp_x, cp_y);
      project.bounceSound.play(); // play the bounce sound
      parent.MoveOnCruvedPath(p1, cp, p2, random(1.5, 4.6)); // we are assigning random duration to create a difference in speed between iteration
      startPoint=p2; // assigning the endpoint as the next iteration start point;
    } else
    {
      parent.Update();
      for (ShapeManager child : children) {
        child.Update();
      }
    }
  }

}
