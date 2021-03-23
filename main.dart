

//1. main function - entry point info a dart program
void main() {
  print("Hello, GDG Nyeri");
  print("Welcome to into to Dart");
}

// 2. Everything is an object
void main() {
  var x = -10;

  print(x.abs());
}

// 3. Main types
void main() {
// Numbers - (int, double) num
// Strings - "Hello!" (single and double quotes)
// Booleans - true or false
// Lists - collections of items (like arrays) List<int> 0 indexed
// Maps - Collections with associated Key Value Pairs Map<String, int>
// runes - unicode character points
// symbols - #symbol (simbolic metadata)

  int x = 10;
  double y = 10.0;

  String s = "${x + y}";
  print(s);
  bool b = true;
  print(b);
  List l = [1, 2, 3];
  print(l[0]);
  List<String> ls = ["1", "2", "3"];
  print(ls[1]);

  Map<String, int> map = {
    'A': 10,
    'B': 20,
    'C': 30,
  };

  print(map["A"]);
}

// 4. Functions
// Type based function
int add(int a, int b) {
  return a + b;
}

// No types
add(a, b) {
  return a + b;
}

void main() {
  print(add(1, 2));
  print(add(20.0, 40.0));
  print(add("a", "b"));
  print(add(true, false));
}

// Function as a variable
int add(int a, int b) {
  return a + b;
}

Function fun;

void main() {
  fun = add;

  var result = fun(20, 30);

  print("Result is $result");
}

// Function as a parameter
int add(int a, int b) {
  return a + b;
}

exec(Function op, x, y) {
  return op(x, y);
}

void main() {
  var result = exec(add, 20, 30);
  print("Result is $result");
}

// Inline function => single line function
int add(int x, int y) => x + y;
int sub(int x, int y) => x + y;

// Function as a return type
choose(bool op) {
  if (op == true) {
    return add;
  } else {
    return sub;
  }
}

void main() {
  var result = choose(true)(10, 20);
  print("Result is $result");
}

// Functions inside other data structures
int add(int x, int y) => x + y;
int sub(int x, int y) => x + y;

List<Function> operators = [add, sub];

void main() {
  var result = operators[1](10, 20);
  print("Result is $result");
}

// Anonymus functions
calc(int b) {
  int c = 1;

  return () => print("The value is ${b + c++}");
}

void main() {
  (a, b) {
    print("Hello, from closure: ${a + b}");
  }(20, 30.0);

  var f = calc(10);
  f();
  calc(10)();
  f();
  f();
}

// dynamic vs object
void main() {
  var x = [
    1,
    "2",
    3.0,
    true,
    () {},
    #symbol,
    Runes("123"),
    [1, 2, 3],
    {"A": 4}
  ];

  //dynamic -> Generalizes all Types
  //Object -> All Types are derived from Object

  print(x);
}

// String interpolation
void main() {
  print("This is a String");
  print('This is a String');

  var x = 1.4;
  var y = 2;
  var a = "\"Add numbers: \n\n $x and $y: \$${x + y}\"";
  print(a);
}

// Equality
// == equal to
// != not equal to
// > greater than
// < less than
// >=  greater than or equal to
// <= less than or equal to
// ! negation

void main() {
  bool t = true;
  bool f = false;

  if (!f) {
    print("Negate False");
  } else {
    print("Will never print");
  }

  if (1 < 10) {
    print("1 is less than 10");
  } else if (1 >= 0) {
    print("1 is greater than or equal to 0");
  } else if (-1 < 0) {
    print("Will never print");
  }
}

// Switch statement
void main() {
  var s = "Circle";
  switch (s) {
    case "Square":
      print("4 sides");
      break;
    case "Rectangle":
      print("4 sides with 2 different lengths");
      break;
    case "Circle":
      print("Round and Round we go");
      break;
    default:
      print("No match");
  }
}

// Combining cases
void main() {
  var digit = 1;

  switch (digit) {
    case 0:
      print("zero");
      break;
    case 1:
    case 2:
    case 3:
    case 4:
      print("four");
      break;
    default:
      print("not a digit");
  }
}

// While loop
void main() {
  int x = 10;
  while (x > 1) {
    print("$x");
    x--;
  }
}

// Do-while loop
void main() {
  int x = 10;
  do {
    print("$x");
    x--;
  } while (x > 1);
}

// For loops
void main() {
  var y;
  for (int x = 10; x > 1; x--) {
    y = x + 1;
    print("$x");
  }

  print(y);
}

// Classes
class Vehicle {
  String model;
  int tyres;
  String type;
}

void main() {
  var toyota = Vehicle();
  toyota.model = 'Toyota';
  toyota.tyres = 4;
  toyota.type = 'saloon';

  // var toyota = Vehicle()..tyres = 4..type = 'saloon'..model = 'Toyota';

  print(toyota.model);
  print(toyota.tyres);
  print(toyota.type);

  print(toyota);
}

// Default Object functions
//toString
class Vehicle {
  String model;
  int tyres;
  String type;

  @override
  String toString() {
    return super.toString();
  }

  // @override
  // String toString() {
  //   return 'Vehicle(Model $model, Type: $type, Tyres: $tyres)';
  // }
}

void main() {
  var toyota = Vehicle()
    ..tyres = 4
    ..type = 'saloon'
    ..model = 'Toyota';
  var toyota2 = Vehicle()
    ..tyres = 4
    ..type = 'saloon'
    ..model = 'Toyota';

  print(toyota);
  print(toyota2);
  // print(toyota == toyota2);
}

// Class equality
class Vehicle {
  String model;
  int tyres;
  String type;

  @override
  String toString() {
    return 'Vehicle(Model $model, Type: $type, Tyres: $tyres)';
  }

  bool operator ==(other) {
    if (other is Vehicle) {
      return other.type == type && other.tyres == tyres && other.model == model;
    }
    return false;
  }
}

void main() {
  var toyota = Vehicle()
    ..tyres = 4
    ..type = 'saloon'
    ..model = 'Toyota';
  var toyota2 = Vehicle()
    ..tyres = 4
    ..type = 'saloon'
    ..model = 'Toyota';

  print(toyota == toyota2);
}

// Constructors
class Vehicle {
  String model;
  int tyres;
  String type;

  // Vehicle(this.model, this.tyres, this.type);

  Vehicle(String model, int tyres, String type){
    this.tyres = tyres;
    this.type = type;
    this.model = model;
  }

  @override
  String toString() {
    return 'Vehicle(Model $model, Type: $type, Tyres: $tyres)';
  }

  bool operator ==(other) {
    if (other is Vehicle) {
      return other.type == type && other.tyres == tyres && other.model == model;
    }
    return false;
  }
}

void main() {
  var toyota = Vehicle('Toyota', 4, 'saloon');
  print(toyota);
}

// Named constructors
class Vehicle {
  String model;
  int tyres;
  String type;

  Vehicle(this.model, this.tyres, this.type);

  Vehicle.saloon(String model) : this(model, 4, 'saloon');

  Vehicle.motocycle(String model) : this(model, 2, 'motorcycle');

  @override
  String toString() {
    return 'Vehicle(Model $model, Type: $type, Tyres: $tyres)';
  }

  bool operator ==(other) {
    if (other is Vehicle) {
      return other.type == type && other.tyres == tyres && other.model == model;
    }
    return false;
  }
}

void main() {
  var toyota = Vehicle('Toyota', 4, 'saloon');
  var subaru = Vehicle.saloon('Subaru');
  var bmw = Vehicle.motocycle('BMW');
  print(toyota);
  print(subaru);
  print(bmw);
}