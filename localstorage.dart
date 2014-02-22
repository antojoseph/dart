import 'dart:html';

void main() {
  InputElement username = query('#username');
  InputElement task = query('#task');
  
  InputElement submit = query('#save');
  InputElement clear = query('#clear');
  
  Element output = query('#username-output');
  Element output_task = query('#task-output');
  
  Storage localStorage = window.localStorage;

 
  String savedUsername = localStorage['username'];
  String savedTask = localStorage['task'];

  if (savedUsername != null) {
    output.text = savedUsername;
  }
  if (savedTask != null){
    output_task.text = savedTask;
  }

  submit.onClick.listen((Event e) {
    output.text = username.value;
    output_task.text = task.value;
    localStorage['username'] = username.value;
    localStorage['task'] = task.value;
  });
  
  clear.onClick.listen((Event e){
     localStorage.clear();
     output.text = "";
     output_task.text = "";
     username.value ="";
     task.value ="";
  });
}

