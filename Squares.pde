ArrayList <Square> items; 
Special pop;
boolean spotOn = false;
boolean correct = true;
int otherX, otherY;
int sizeOfSquare = 10;
int numSquares = 200;
int timer = 200; 
boolean gameover = false; 
int level = 1; 

public void setup(){


	size(500,500);
	background(0);
	//intitalizing onces
	items = new ArrayList <Square>();
	pop = new Special();
	//drawing once
	for(int i = 0; i < numSquares;i++){
		items.add(new Square());
		items.get(i).show();
	}
	pop.show();

	

}

public void draw(){
	timer--;
	stroke(16,6,97);
	fill(16,6,97);
    ellipse(430,430,60,60);
    fill(255,0,0);
    stroke(255,0,0);
    textSize(20);
    text(timer, 410,430);

    stroke(16,6,97);
	fill(16,6,97);
    rect(40,410,60,60);
    fill(255,0,0);
    stroke(0,0,0);
    textSize(20);
    text(level, 60,450);

    if(timer >= 0){
    	gameover = false;
    }else if(timer < 0 ){
    	background(135,135,135);
		stroke(255,255,255);
		text("GAMEOVER", 200,200);
	
    }
    
	if(mousePressed){
		if ((mouseX > otherX - sizeOfSquare) && (mouseX < otherY +sizeOfSquare) && (mouseY > otherY - sizeOfSquare) && (mouseY < otherY + sizeOfSquare)){
			spotOn = true;
					
		}else{
			correct = false;

		}
	}

}

public void drawTemplate(){
	background(0);
	items = new ArrayList <Square>();
	pop = new Special();
	for(int i = 0; i < numSquares;i++){
		items.add(new Square());
		items.get(i).show();
	}
	pop.show();

}


public void mouseClicked() {

  if(spotOn == true) { 
    correct = true; 
   background(0);
   drawTemplate();
   timer = timer + 200;
   level++;

  } 
  	else if(correct == false){
    spotOn = false;
    timer = -1000;
		/*background(0);
		stroke(255,255,255);
		text("GAME OVER", 50,50);*/
	

  } 
	spotOn = false;
	correct = true;
}

class Square{
	int myX, myY;	
	Square(){
	myX = (int)(Math.random()*390)+30;
	myY = (int)(Math.random()*390);

	}
	public void show(){
		stroke(0);
		fill(255,255,255);
		
		rect(myX, myY, sizeOfSquare,sizeOfSquare);
	}
}
class Special{
	
	Special(){
	otherX = (int)(Math.random()*390)+30;
	otherY =(int)(Math.random()*390);

	}
	public void show(){
		stroke(0);
		fill(107, 255, 248);
		rect(otherX,otherY, sizeOfSquare,sizeOfSquare);
	}
}
