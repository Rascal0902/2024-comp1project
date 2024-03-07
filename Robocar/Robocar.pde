import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 
import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.*; 
import java.awt.Frame;
import processing.awt.PSurfaceAWT;
import processing.core.PApplet;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Vector;

public class Robocar extends PApplet {
    PFont myFont;
    int ex;
    float A, W, S, D, ct, DA, DD;
    MySystem system;
    int codelength=0;
    String[] retrieve;
    String[] code= new String[10000];
    Queue<PVector> command = new LinkedList<PVector>();
    void showstring(float x, float y) {//화면에 코드 표시
    }
    void retreive() {}
    void fileSelected(File selection) { //retrieve
    } 
    void savecode() { //save
    }
    void commandout() {
     if (command.size()>0) {
       Code com = new Code();
     if (command.peek().y<=0) {
       command.remove();
       return;
      }
      command.peek().y--;
      if (command.peek().x==0) {
       com.goAhead();
      }
      if (command.peek().x==1) {
      com.goBack();
      }
      if (command.peek().x==2) {
      com.goRight();
      }
      if (command.peek().x==3) {
      com.goLeft();
      }
      if (command.peek().x==4) {
      com.turnRight();
      }
      if (command.peek().x==5) {
      com.turnLeft();
      }
      if (command.peek().x==6) {
      com.goDriftRight();
      }
      if (command.peek().x==7) {
      com.goDriftLeft();
      }
      if (command.peek().x==8) {
      com.booster();
      }
      if (command.peek().x==9) {
      com.goBreak();
      }
      if (command.peek().x==10) {
      com.reset();
      }
     }
      return;
    }
    void console() {
     //substring을 이용하여 읽은 후 명령 실행
    }
    void setting() {
  textAlign(CENTER);
  myFont = createFont("바탕체", 32);
  textFont(myFont);
    }
    void display() {
  if (ex==0) {
    background(255);
    //window1
    window0();
  }
  if (ex==1) {
    background(255);
    //window2
    window1();
  }
    }
    void window0() {
  //자세한 내용 //viewer
  fill(0);
  stroke(0);
  textSize(20);
  text("Robocar by 24학번 박건호", 1650, 880);
  fill(0);
  stroke(0);
    }
    void window1() {//compiler
    }
    void arrowcheck1() {
  if (system.keyboardManager.isPressed('a')) {
    //cart.goRight();
  }  
  if (system.keyboardManager.isPressed('d')) {
    //cart.goLeft();
  }
  if (system.keyboardManager.isPressed('w')) {
    //cart.goFoward();
  }
  if (system.keyboardManager.isPressed('s')) {
    //cart.goback();
  }
  if (system.keyboardManager.isPressed(' ')) {
    //cart.booster();
  }
  if (system.keyboardManager.isPressed(SHIFT+1)) {
    //cart.stp();
  }
  if (system.keyboardManager.isPressed(SHIFT)) {
    if (system.keyboardManager.isPressed('a')) {
      //cart.godriftLeft();
    }
    if (system.keyboardManager.isPressed('d')) {
      //cart.godriftRight();
    }
  }
  if (system.keyboardManager.isPressed('r')) {
    //cart.position=new PVector(0, 0, 0);
  }
  //ui
  fill(0);
  stroke(0);
    }
    void keyPressed(){system.keyboardManager.onKeyPress(key,keyCode);}

    void keyReleased(){system.keyboardManager.onKeyRelease(key,keyCode);}

    void mousePressed(){system.mouseManager.onMousePressed(mouseX,mouseY,mouseButton); }

    void mouseReleased(){system.mouseManager.onMouseReleased(mouseX,mouseY,mouseButton); }

    void mouseMoved(){system.mouseManager.onMouseMoved(mouseX,mouseY);}

    void mouseDragged(){system.mouseManager.onMouseMoved(mouseX,mouseY);}

    void mouseWheel(MouseEvent event) {}
    public static void main(String args[]) {
        PApplet.main("Robocar");
    }
    public void settings() { size(1800,900);smooth();}
    public void setup() {setting();system= new TestSys();}
    public void draw() {display();system.display();}
    class Car extends Carphysics {
      float x, y, z; //carvideo 기준 좌표
      float R, G, B; // 차 색깔
      Car(float x, float y, float z) {
       this.x=x;
       this.y=y;
       this.z=z; 
       //바퀴
       // 바퀴 4개
      }
      void carshow() {
       // 바퀴 4개 display
       // 차체 구성
      }
    }
    class Carphysics {
     PVector position;
     PVector velocity;
     PVector accleration;

     float k=0.2; //마찰력 비례 계수

     Wheel[] carwheel = new Wheel[4]; // wheel 

     void update() {
      //갱신
     }
     void goFoward() {
     }
     void goback() {
     }
     void goRight() {
     }
     void goLeft() {
     }
     void godriftRight() {
     }
     void godriftLeft() {
     }
     void booster() {
     }
     void stp() {
     }
     void nothing() {//효과 제거
     }
     void frontwheelangle() {
     } // 바퀴 회전
     void frontwheelmove() {
     } // 바퀴 움직임
    }
    class Wheel {

     float x, y, z, wheelwidth, r, Red, Green, Blue;

     float angle=0; // 회전 각
     float delta; // 바퀴 회전 차이

     Wheel() {
     }

     void locatechangewheel(float x, float y, float z) {
      this.x=x;
      this.y=y;
      this.z=z;
     } //위치 설정
     void wheelcolor(float Red, float Green, float Blue) {
      this.Red=Red; 
      this.Green=Green; 
      this.Blue=Blue;
     } //색상 설정
     void shiftangle() {
     }   // 바퀴 자체 회전 
     void movewheel() {
     }  
     void display() {
     }
     void change3D(float a, float b, float c) {
     } //좌표계 설정
    }
    class PVector{
     float x,y,z;
     PVector(float x,float y){this.x=x;this.y=y;}
     PVector(float x,float y,float z){this.x=x;this.y=y;this.z=z;}
     float norm(PVector s){return sqrt(s.x*s.x+s.y*s.y+s.z*s.z);}
     float norm(){return sqrt(this.x*this.x+this.y*this.y+this.z*this.z);}
     void add(PVector s){this.x=this.x+s.x;this.y=this.y+s.y;this.z=this.z+s.z;} 
     void add(float x,float y,float z){this.x=this.x+x;this.y=this.y+y;this.z=this.z+z;} 
     void sub(PVector s){this.x=this.x-s.x;this.y=this.y-s.y;this.z=this.z-s.z;}
     void mult(float s){this.x=this.x*s;this.y=this.y*s;this.z=this.z*s;}
     void div(float s){this.x=this.x/s;this.y=this.y/s;this.z=this.z/s;}
     void normalize(){float norm=norm(this);this.x=this.x/norm;this.y=this.y/norm;this.z=this.z/norm;}
     void moveceta(float ceta){float x,z;
     x=this.x; z=this.z;
     this.x=x*cos(radians(ceta))-z*sin(radians(ceta));
     this.z=x*sin(radians(ceta))+z*cos(radians(ceta));} 
    }
    interface codeable {
     abstract void goAhead();
     abstract void goBack();
     abstract void goRight();
     abstract void goLeft();
     abstract void turnRight();
     abstract void turnLeft();
     abstract void goDriftRight();
     abstract void goDriftLeft();
     abstract void booster();
     abstract void goBreak();
     abstract void reset();
    }
    class Code implements codeable {
     Code() {
     }
     void goAhead() {//'w',87
     }
     void goBack() {//'s',83
     }
     void goRight() {//'w',87  'd',68
     }
     void goLeft() {//'w',87 'a',65
     }
     void turnRight() {//'d',68
     }
     void turnLeft() {//'a',65
     }
     void goDriftRight() {//'d',68 SHIFT,16
     }
     void goDriftLeft() {//'a',65 SHIFT,16
     }
     void booster() {//' ',32
     }
     void goBreak() {//CTRL,17
     }
     void reset() {
     }
    }
    class Coordinate{
  
  float coordinateTRUE,size,coordinateBW,rangecover,coordinaterange,locatex,locatey;
  
  float ceta,pi;
  
  float[] A = new float[100]; //임시 저장소
  
  Coordinate(){}
  
  Coordinate(float coordinateTRUE,float size,float coordinateBW,float rangecover,float coordinaterange){
    this.coordinateTRUE=coordinateTRUE; this.size=size; this.coordinateBW=coordinateBW; this.rangecover=rangecover; this.coordinaterange=coordinaterange; }
    
  void locate(float locatex,float locatey){
    this.locatex=locatex; this.locatey=locatey;}
    
  void setangle(float ceta,float pi){
    this.ceta=ceta; this.pi=pi;}
    
  void mouseanglechange(float x,float y){
    if((x>=locatex-rangecover && x<=locatex+rangecover && y>=locatey-rangecover && y<=locatey+rangecover && mousePressed)
       && !((mouseX>=30)&&(mouseX<=130)&&(mouseY>=120)&&(mouseY<=150))
       && !((mouseX>=30)&&(mouseX<=130)&&(mouseY>=180)&&(mouseY<=210))
       && !((mouseX>=30)&&(mouseX<=130)&&(mouseY>=240)&&(mouseY<=270))
      ){
      ceta=map(x,locatex-rangecover,locatex+rangecover,0,360);pi=map(y,locatey-rangecover,locatey+rangecover,0,360);}}
      
  void coordTRUE(){
    if(coordinateTRUE==1){coordinateTRUE=0;}else{coordinateTRUE=1;}}
    
  void display(){
    fill(255);stroke(255);rect(locatex-rangecover,locatey-rangecover,2*rangecover,2*rangecover);
    strokeWeight(5);fill(0);
    if (coordinateTRUE==1) {
    line3D(0, 0, 0, coordinaterange, 0, 0, size, 255, 255*coordinateBW, 255*coordinateBW, 5 ,0);
    line3D(0, 0, 0, 0, coordinaterange, 0, size, 255*coordinateBW, 255, 255*coordinateBW, 5 ,0);
    line3D(0, 0, 0, 0, 0, coordinaterange, size, 255*coordinateBW, 255*coordinateBW, 255, 5 ,0);
    textSize(20);stroke(255);fill(255*coordinateBW);
    check3D(coordinaterange+10, 0, 0, size);       text("+x", locatex+A[0], locatey+A[1]);
    check3D(0, coordinaterange+10, 0, size);       text("+y", locatex+A[0], locatey+A[1]);
    check3D(0, 0, coordinaterange+10, size);       text("+z", locatex+A[0], locatey+A[1]);
    fill(0);stroke(0);}}
    
  void point3D(float x,float y,float z,float siz){if(siz==0){siz=size;}stroke(255*coordinateBW);
    check3D(x,y,z,siz);
    strokeWeight(5);point(locatex+A[0],locatey+A[1]);fill(0);stroke(0);strokeWeight(5);}
    
  void point3D_RGB(float x,float y,float z,float R,float G,float B,float st,float siz,float alpha){if(siz==0){siz=size;}
    check3D(x,y,z,siz);
    if(alpha==0){strokeWeight(st);stroke(R,G,B);point(locatex+A[0],locatey+A[1]);stroke(0);strokeWeight(5);}
    else{strokeWeight(st);stroke(R,G,B,alpha);point(locatex+A[0],locatey+A[1]);stroke(0);strokeWeight(5);}}
    
  void line3D(float x,float y,float z,float w,float m,float n,float siz,float R,float G,float B,float strokeweight,float alpha){if(siz==0){siz=size;}
    A[2]=check3Dx(x,y,z,siz);A[3]=check3Dy(x,y,z,siz);
    A[4]=check3Dx(w,m,n,siz);A[5]=check3Dy(w,m,n,siz);
    if(alpha==0){strokeWeight(strokeweight);stroke(R,G,B);line(locatex+A[2],locatey+A[3],locatex+A[4],locatey+A[5]);stroke(0);strokeWeight(5);}
    else{strokeWeight(strokeweight);stroke(R,G,B,alpha);line(locatex+A[2],locatey+A[3],locatex+A[4],locatey+A[5]);stroke(0);strokeWeight(5);}}
    
  /*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
  void check3D(float x,float y,float z,float siz){if(siz==0){siz=size;}
    A[0]=check3Dx(x,y,z,siz);A[1]=check3Dy(x,y,z,siz);}
    
  float check3Dx(float x,float y,float z,float siz){if(siz==0){siz=size;}
  return (x*cos(radians(ceta))-z*sin(radians(ceta)))*siz;}
  
  float check3Dy(float x,float y,float z,float siz){if(siz==0){siz=size;}
  return (y*cos(radians(pi))-x*sin(radians(pi))*sin(radians(ceta))-z*cos(radians(ceta))*sin(radians(pi)))*siz;}
  
  float check3Dz(float x,float y,float z,float siz){if(siz==0){siz=size;}
  return (x*cos(radians(pi))*sin(radians(ceta))+y*sin(radians(pi))+z*cos(radians(ceta))*cos(radians(pi)))*siz;}
  
  /*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
  void quad3D(float x1,float y1,float z1,float x2,float y2,float z2,float x3,float y3,float z3,float x4,float y4,float z4,float R,float G,float B,float siz,float strokeweight,float alpha){
    A[0]=check3Dx(x1,y1,z1,siz);A[1]=check3Dy(x1,y1,z1,siz);
    A[2]=check3Dx(x2,y2,z2,siz);A[3]=check3Dy(x2,y2,z2,siz);
    A[4]=check3Dx(x3,y3,z3,siz);A[5]=check3Dy(x3,y3,z3,siz);
    A[6]=check3Dx(x4,y4,z4,siz);A[7]=check3Dy(x4,y4,z4,siz);
    if(alpha==0){fill(R,G,B);stroke(R,G,B);}else{fill(R,G,B,alpha);stroke(R,G,B,alpha);}strokeWeight(strokeweight);
    beginShape();
    vertex(locatex+A[0],locatey+A[1]);
    vertex(locatex+A[2],locatey+A[3]);
    vertex(locatex+A[4],locatey+A[5]);
    vertex(locatex+A[6],locatey+A[7]);
    endShape(CLOSE);
    strokeWeight(5);fill(0);stroke(0);}
    
  void grid3D(float x1,float y1,float z1,float x2,float y2,float z2,float x3,float y3,float z3,float x4,float y4,float z4,float R,float G,float B,float siz,float strokeweight,float alpha,float gap){
    quad3D(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4,R,G,B,siz,strokeweight,alpha);
    for(int i=0;i<=abs(x4-x1)/gap;i++){line3D(x1+i*gap,y1,z1,x2+i*gap,y2,z2,siz,R,G,B,5,30);}
    for(int i=0;i<=abs(z2-z1)/gap;i++){line3D(x1,y1,z1+i*gap,x4,y4,z4+i*gap,siz,R,G,B,5,30);}}
  void triangle3D(float x1,float y1,float z1,float x2,float y2,float z2,float x3,float y3,float z3,float R,float G,float B,float siz,float strokeweight,float alpha){
    A[0]=check3Dx(x1,y1,z1,siz);A[1]=check3Dy(x1,y1,z1,siz);
    A[2]=check3Dx(x2,y2,z2,siz);A[3]=check3Dy(x2,y2,z2,siz);
    A[4]=check3Dx(x3,y3,z3,siz);A[5]=check3Dy(x3,y3,z3,siz);
    if(alpha==0){fill(R,G,B);stroke(R,G,B);}else{fill(R,G,B,alpha);stroke(R,G,B,alpha);}
    strokeWeight(strokeweight);
    beginShape();
    vertex(locatex+A[0],locatey+A[1]);
    vertex(locatex+A[2],locatey+A[3]);
    vertex(locatex+A[4],locatey+A[5]);
    endShape(CLOSE);strokeWeight(5);fill(0);stroke(0);}
    
  void Bezier3Ddraw(float x0,float y0,float z0,float x1,float y1,float z1,float x2,float y2,float z2,float R,float G,float B,float siz,float alpha){if(siz==0){siz=size;}
  float z,w,k,t=0;
  if(alpha==0){strokeWeight(0);stroke(R,G,B);fill(R,G,B);}else{strokeWeight(0);stroke(R,G,B,alpha);fill(R,G,B,alpha);}
  beginShape();
  check3D(x1,y1,z1,siz);vertex(locatex+A[0],locatey+A[1]);
  for(t=0;t<=1;t+=0.005){z=t*t*x0+2*t*(1-t)*x1+(1-t)*(1-t)*x2;w=t*t*y0+2*t*(1-t)*y1+(1-t)*(1-t)*y2;k=t*t*z0+2*t*(1-t)*z1+(1-t)*(1-t)*z2;
  check3D(z,w,k,siz);   vertex(locatex+A[0],locatey+A[1]);}
  endShape();stroke(0);fill(0);}
  
  void vertex3D(float x,float y,float z,float siz){
    check3D(x,y,z,siz);vertex(locatex+A[0],locatey+A[1]);}
    
    }
    abstract class MySystem{
    KeyboardManager keyboardManager = new KeyboardManager();
    MouseManager mouseManager = new MouseManager();
    MySystem(){}
    abstract public void init();
    abstract public void display();  
    }
    class TestSys extends MySystem{
    char c;  
    TestSys(){super();init();}
    public void init(){c='f';}
    public void display(){
       strokeWeight(2);fill(255);
       ellipseMode(CENTER);
       if(mouseManager.getButtonPressed(0)){fill(255,0,0); }
       if(mouseManager.getButtonPressed(1)){fill(0,255,0); }
       if(mouseManager.getButtonPressed(2)){fill(0,0,255); }
       ellipse(mouseManager.getMouseLocation().x,mouseManager.getMouseLocation().y,10,10);
       strokeWeight(5);}
    }
    class KeyboardManager{
  private static final int keyNum = 60;
   private boolean[] keyState = new boolean[keyNum]; //a~z: 0~25, 0~9: 26,35, ' '=36, 'ENTER'= 37, arrow lurd: 38~41, shift,ctrl,alt: 42~44
   KeyboardManager(){for(int i=0;i<keyNum;i++){keyState[i] = false;}}
   public void onKeyPress(char k,int kc){if(calKey(k,kc)==-1)return;keyState[calKey(k,kc)] = true;}
   public void onKeyRelease(char k,int kc){if(calKey(k,kc)==-1)return;keyState[calKey(k,kc)] = false;}
   public boolean isPressed(int k){return keyState[calKey((char)CODED,k)];}
   public boolean isPressed(char k){return keyState[calKey(k,0)];}
   public boolean isPressed(){
     boolean t = false;
     for(int i=0;i<keyNum;i++){t = t|keyState[i];}
     return t; }
   private int calKey(char k,int kc){
     if(k-'a'>=0&&k-'z'<=0){return k-'a';}
     else if(k-'A'>=0&&k-'Z'<=0){return k-'A';}
     else if(k-'0'>=0&&k-'9'<=0){return k-'0'+'z'-'a'+1;}
     else if(k==' '){return  36;}
     else if(k=='\n'){return  37;}
     else if(k==CODED){
         if(kc-LEFT>=0&&38+kc-LEFT<=41){return 38+kc-LEFT;}
         else if(kc-SHIFT>=0&&kc-SHIFT+42<=44){return 42+kc-SHIFT;}}
     else if(k==27){return  45;}//esc
     else{switch(k){case '-':case '_':return 46;
                    case '=':case '+':return 47;
                    case '{':case '[':return 48;
                    case ']':case '}':return 49;
                    case ';':case ':':return 50;
                    case '\'':case '"':return 51;
                    case ',':case '<':return 52;
                    case '.':case '>':return 53;
                    case '?':case '/':return 54;}}
     return -1;}
    }
    class MouseManager{
    private int x,y;
    private boolean[] button = new boolean[3]; //left = 0, right = 1, center = 2
    MouseManager(){button[0] = false;button[1] = false;x = 0;y = 0;}
    MouseManager(int tx,int ty){x = tx;y = ty;button[0] = false;button[1] = false;}
   public void onMousePressed(int tx,int ty,int b1){
    x = tx;y = ty;
    if(b1==37){button[0] = true;}
    else if(b1==39){button[1] = true;}
    else if(b1==3){button[2] = true;}}
   public void onMouseReleased(int tx,int ty,int b1){
    x = tx;y = ty;
    if(b1==37){button[0] = false;}
    else if(b1==39){button[1] = false;}
    else if(b1==3){button[2] = false;}} 
   public void onMouseMoved(int tx,int ty){
      x = tx;y = ty;}
   public PVector getMouseLocation(){
      return new PVector(x,y); }
   public boolean getButtonPressed(int b){
      return button[b]; }
    }
    class movingcoordinate extends Coordinate{// (0,0,0) 기준 movingceta movingpi만큼 회전한걸 그린후 *(movingx,y,z)으로 이동
    }
}
