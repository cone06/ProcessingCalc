Panel panel;
float valor1 = 0;
float valor2 = 0;
float aux = 0;
String simbolo;
boolean opt = false;


void setup() {
  textAlign(RIGHT);
  size(345,440);
  panel = newPanel();
  RadioButtonGroup g = new RadioButtonGroup();
  panel.add(
    newVBox().gap(0).position(0,0).size(346,440)
    .add(newHBox()
      .add(newTextField().columns(12).value("").id("screen").fontSize(50).fillColor(#87909C).fontColor(255))
    )
     .add(newHBox().gap(0)
      .add(newButton("C").id("C").fontSize(20).fillColor(#D8D8D8))
      .add(newButton("+/-").id("+/-").fontSize(30).fillColor(#D8D8D8))
      .add(newButton("%").id("%").fontSize(30).fillColor(#D8D8D8))
      .add(newButton("/").id("/").fontSize(30).fillColor(#FF8100).fontColor(255))
    )
    .add(newHBox().gap(0)
      .add(newButton("7").id("7").fontSize(30).fillColor(#D8D8D8))
      .add(newButton("8").id("8").fontSize(30).fillColor(#D8D8D8))
      .add(newButton("9").id("9").fontSize(30).fillColor(#D8D8D8))
      .add(newButton("X").id("X").fontSize(30).fillColor(#FF8100).fontColor(255))
    )
    .add(newHBox().gap(0)
      .add(newButton("4").id("4").fontSize(30).fillColor(#D8D8D8))
      .add(newButton("5").id("5").fontSize(30).fillColor(#D8D8D8))
      .add(newButton("6").id("6").fontSize(30).fillColor(#D8D8D8))
      .add(newButton("-").id("-").fontSize(30).fillColor(#FF8100).fontColor(255))
    )
    .add(newHBox().gap(0)
      .add(newButton("1").id("1").fontSize(30).fillColor(#D8D8D8))
      .add(newButton("2").id("2").fontSize(30).fillColor(#D8D8D8))
      .add(newButton("3").id("3").fontSize(30).fillColor(#D8D8D8))
      .add(newButton("+").id("+").fontSize(30).fillColor(#FF8100).fontColor(255))
    )
    .add(newHBox().gap(0)
      .add(newButton("0").id("0").width(172).fontSize(30).fillColor(#D8D8D8))
      .add(newButton(",").id(".").width(86).fontSize(30).fillColor(#D8D8D8))
      .add(newButton("=").id("=").width(86).fontSize(30).fillColor(#FF8100).fontColor(255))
    )
    
  );
  panel.update();
}

void draw() {
  background(255);
  panel.draw();
}

void mousePressed() {
  panel.mouseDown(mouseX,mouseY,new Click());
}

void mouseReleased() {
  panel.mouseUp(mouseX,mouseY,null);
}

void keyPressed() {
  panel.keyStroke(key,keyCode,null);
}

class Click extends Action {
  void run(Graphic g) {
    Control c = (Control)g;
    if (c.id()=="C") 
      borar();
    else if (c.id()=="+" || c.id()=="-" || c.id()=="X" || c.id()=="/")
      operacion(c);
    else if(c.id()=="%")
      porcentaje(c);
    else if(c.id()=="=")
      resultado(c);
    else
      printPanel(c);
  }
  
  void porcentaje(Control c){
    Control screen = (Control)panel.getById("screen");
      valor2 = float(screen.value());
      if(simbolo == "X"){
        valor1 = valor1 * valor2 / 100;
        screen.value(str(valor1));
      }
      else
        screen.value("error");
      panel.update();
  }
  
  void resultado(Control c){
     Control screen = (Control)panel.getById("screen");
      valor2 = float(screen.value());
      if(simbolo == "")
        valor1 = float(screen.value());
      else if(simbolo == "+")
        valor1 = valor1 + valor2;
      else if(simbolo == "-")
        valor1 = valor1 - valor2;
      else if(simbolo == "X")
        valor1 = valor1 * valor2;
      else if(simbolo == "/")
        valor1 = valor1 / valor2;
      screen.value(str(valor1));
      simbolo = "";
      panel.update();
  }
  
  void operacion(Control c){
    Control screen = (Control)panel.getById("screen");
    valor1 = float(screen.value());
    simbolo = c.id();
    screen.value(c.id());
    opt = true;
    panel.update();
  }
  
  void printPanel(Control c) {
    if(opt == true){
      borar();
      opt = false;
    }
    Control screen = (Control)panel.getById("screen");
    aux = float(screen.value());
    if(c.id()=="+/-"){
      aux = aux * -1;
      screen.value(str(aux));
    }else
      screen.value(screen.value() + c.id());
    panel.update();
  }
  
  void borar(){
    Control screen = (Control)panel.getById("screen");
    screen.value("");
    panel.update();
  }
    
}