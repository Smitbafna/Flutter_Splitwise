import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 102, 94, 117)),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/third': (context) => const ThirdPage(),
          '/seventhPage': (context) => SeventhPage(), // Your 7th page
          '/eighthPage': (context) => EighthPage(),
          '/sixthPage': (context) => SixthPage(), // Your 8th page
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ElevatedButton(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          onPressed: () {
            // Navigate to the login screen
            Navigator.pushNamed(context, '/login');
          },
          child: const Text('Go to Login'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ThirdPage()), // Replace with your actual third page widget
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/Frame.png'),

            const SizedBox(height: 20),

            const Text(
              'SPLITWISE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 10), // Spacer
            Text(
              'Split bills the easy way',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Background ellipse image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height *
                  0.5, // Half of the screen height
              child: Image.asset(
                'assets/ellipse.png',
                fit: BoxFit.cover,
              ),
            ),

            // Frame image within ellipse
            Positioned(
              top: MediaQuery.of(context).size.height *
                  0.2, // Example positioning
              left: MediaQuery.of(context).size.width * 0.4 -
                  MediaQuery.of(context).size.width *
                      0.05, // Example positioning
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3, // Example width
                child: Image.asset(
                  'assets/Frame.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Text within ellipse
            Positioned(
              top: MediaQuery.of(context).size.height *
                  0.4, // Example positioning
              left: MediaQuery.of(context).size.width * 0.37 -
                  MediaQuery.of(context).size.width *
                      0.05, // Example positioning
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'SPLITWISE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: MediaQuery.of(context).size.height *
                  0.55, // Start below the first half of the screen
              left: 0,
              right: 0,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // First Button

                      Column(
                        children: <Widget>[
                          // Second Button
                          ElevatedButton(
                            onPressed: () {
                              // Handle button press
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FourthPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.8,
                                  50), // Width and height
                              backgroundColor: const Color.fromRGBO(
                                  102, 102, 102, 1), // Background color
                              foregroundColor: Colors.white, // Font color
                            ),
                            child: const Text('LOGIN'),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              // Handle button press
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FifthPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.8,
                                  50), // Width and height
                              backgroundColor: const Color.fromRGBO(
                                  91, 197, 166, 1), // Background color
                              foregroundColor: Colors.white, // Font color
                            ),
                            child: const Text('SIGN UP'),
                          ),

                          const SizedBox(width: 50), // Spacer between buttons

                          // First Image
                          Row(
                            children: <Widget>[
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 30.0),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(
                                      241, 237, 237, 1), // RGBA color
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Border radius
                                ),
                                width: MediaQuery.of(context).size.width *
                                    0.3, // Increased width for background
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.15, // Width of the image
                                    child: Image.asset(
                                      'assets/google.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              // Second Image
                              const SizedBox(width: 30),

                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(21, 125, 195, 1),
                                  // RGBA color
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Border radius
                                ), // Background color
                                width: MediaQuery.of(context).size.width *
                                    0.3, // Increased width for background
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.15, // Width of the image
                                    child: Image.asset(
                                      'assets/facebook.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fourth Page'),
      ),
    );
  }
}

class FifthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Dummy data
  final List<Map<String, String>> dummyData = [
    {'email': 'user1@example.com', 'password': 'password1'},
    {'email': 'user2@example.com', 'password': 'password2'},
    {'email': 'user3@example.com', 'password': 'password3'},
    {'email': '1', 'password': '1'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fifth Page'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Background ellipse image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.43,
            child: Image.asset(
              'assets/ellipse.png',
              fit: BoxFit.cover,
            ),
          ),

          // Frame image within ellipse
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.15 -
                MediaQuery.of(context).size.width * 0.05,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.10,
              child: Image.asset(
                'assets/Frame.png',
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Text within ellipse
          Positioned(
            top: MediaQuery.of(context).size.height * 0.055,
            left: MediaQuery.of(context).size.width * 0.38 -
                MediaQuery.of(context).size.width * 0.05,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'SPLITWISE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.17,
            left: MediaQuery.of(context).size.width * 0.15 -
                MediaQuery.of(context).size.width * 0.05,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'LOGIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.17,
            left: MediaQuery.of(context).size.width * 0.75 -
                MediaQuery.of(context).size.width * 0.05,
            child: const Opacity(
              opacity: 0.5, // Set the desired opacity value (0.0 to 1.0)
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'SIGNUP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Signup form and login buttons
          Positioned(
            top: MediaQuery.of(context).size.height * 0.265,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 35),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          // Handle forgot password tap
                        },
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          String email = _emailController.text;
                          String password = _passwordController.text;

                          bool isValid = dummyData.any((user) =>
                              user['email'] == email &&
                              user['password'] == password);

                          if (isValid) {
                            // If the form is valid and the credentials match, navigate to the SixthPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SixthPage()),
                            );
                          } else {
                            // Show error message if credentials do not match
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Invalid email or password'),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.75,
            left: MediaQuery.of(context).size.width * 0.15,
            child: Container(
              height: 30, // Height of the container
              width: 90, // Width of the container
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/google.png', // Replace with your image asset path
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.75,
            right: MediaQuery.of(context).size.width * 0.15,
            child: Container(
              height: 30, // Height of the container
              width: 90, // Width of the container
              decoration: BoxDecoration(
                color: const Color.fromRGBO(21, 125, 195, 1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/facebook.png', // Replace with your image asset path
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SixthPage extends StatelessWidget {
  const SixthPage({Key? key}) : super(key: key);

  void _incrementCounter() {
    // Implement your logic for the floating action button press
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(76, 187, 155, 1.0) // Fully opaque
        ,
        leading: Theme(
          data: ThemeData(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ), // Set icon color to white
          ),
          child: IconButton(
            icon: const Icon(Icons.menu), // Hamburger icon
            onPressed: () {
              // Handle menu button press
            },
          ),
        ),
        title: const Text(
          'SPLITWISE',
          style: TextStyle(
            color: Colors.white,
          ), // Set title text color to white
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                right: 20.0), // Add padding to move the button to the left
            child: IconButton(
              icon:
                  const Icon(Icons.search, color: Colors.white), // Search icon
              onPressed: () {
                // Handle search button press
              },
            ),
          ),
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert), // Three dots icon
            onSelected: (item) {
              // Handle menu selection
            },
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Item 1'),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Item 2'),
              ),
            ],
          ),
        ],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      backgroundColor: Color.fromRGBO(76, 187, 155, 1.0) // Fully opaque
      ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Section
          Container(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image below Splitwise text
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 0.0),
                          Image.asset(
                            'assets/Icon.png', // Replace with your image asset path
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height *
                                0.1, // Adjust height as needed
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0, // Adjust this value to move the circle above
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.1,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: CustomPaint(
                            painter: createCirclePainter(),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 8, // Adjust this value to move the text up or down
                        left: 4,
                        right: 0,
                        child: Text(
                          'M',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:
                                Color.fromRGBO(76, 187, 155, 1.0), // Text color
                            fontSize: 28, // Adjust font size as needed
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container for three things
              ],
            ),
          ),

          // Container below Splitwise image
          const Positioned(
            top: 20, // Adjust this value to position the text below the circle
            left: 0,
            right: 0,
            child: Text(
              'Meha Bakliwal',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 16, // Adjust font size as needed
              ),
            ),
          ),
          // Container below Splitwise definition
          SizedBox(height: 16.0), // Adjust height as needed
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10.0),
                              Text(
                                'You are owed',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14.0, // Customize the font size
                                ), // Apply the Lato regular style
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Text(
                                    '₹ ',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 12.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                  Text(
                                    ' 1500',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 24.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            'assets/rect.png', // Replace with your image asset path
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height *
                                0.1, // Adjust height as needed
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10.0),
                              Text(
                                'You owe',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14.0, // Customize the font size
                                ), // Apply the Lato regular style
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Text(
                                    '₹ ',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 12.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                  Text(
                                    ' 750',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 24.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                          SizedBox(width: 10.0),
                          Image.asset(
                            'assets/rect.png', // Replace with your image asset path
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height *
                                0.1, // Adjust height as needed
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10.0),
                              Text(
                                'Total Balance',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14.0, // Customize the font size
                                ), // Apply the Lato regular style
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Text(
                                    '₹ ',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 12.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                  Text(
                                    ' 750',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 24.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              // Add child widgets as needed
              child: Stack(
                children: [
                  Positioned(
                    top: 10.0,
                    left: 4,
                    right: 4,
                    // Adjust the top position as needed
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                // Handle button press
                              },
                              child: Text('FRIENDS'),
                            ),
                            Image.asset(
                              'assets/line.png', // Replace with your image asset path
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height *
                                  0.003, // Adjust height as needed
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle button press
                            Navigator.pushNamed(context, '/seventhPage');
                          },
                          child: Text('GROUPS'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle button press
                            Navigator.pushNamed(context, '/eighthPage');
                          },
                          child: Text('ACTIVITY'),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 38.0,
                      left: 4,
                      right: 4,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 60.0,
                            width: MediaQuery.of(context).size.width *
                                0.8, // Adjust the width as needed
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                // CustomPaint widget positioned
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: CustomPaint(
                                    painter: ThinCirclePainter(),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Center(
                                        child: Text(
                                          'S',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Column widget positioned
                                Positioned(
                                  left:
                                      60, // 40 (width of the circle) + 10 (space) + 10 (left margin)
                                  top:
                                      10, // Aligning it with the top of the circle
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 15,
                                        child: Center(
                                          child: Text(
                                            'Sushil Kumar',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left:
                                                10.0), // Space between the two text containers
                                        child: Container(
                                          width: 40,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              'You owe',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  left:
                                      230, // Adjust this value based on the desired position
                                  top: 10,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          width: 5,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              '₹',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              15), // Space between the two text boxes
                                      Container(
                                        width: 40,
                                        height: 60,
                                        child: Center(
                                          child: Text(
                                            '500',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 60.0,
                            width: MediaQuery.of(context).size.width *
                                0.8, // Adjust the width as needed
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                // CustomPaint widget positioned
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: CustomPaint(
                                    painter: ThinCirclePaintergreen(),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Center(
                                        child: Text(
                                          'S',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Column widget positioned
                                Positioned(
                                  left:
                                      60, // 40 (width of the circle) + 10 (space) + 10 (left margin)
                                  top:
                                      10, // Aligning it with the top of the circle
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 15,
                                        child: Center(
                                          child: Text(
                                            'Sushil Kumar',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left:
                                                10.0), // Space between the two text containers
                                        child: Container(
                                          width: 40,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              'You owe',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  left:
                                      230, // Adjust this value based on the desired position
                                  top: 10,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          width: 5,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              '₹',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              15), // Space between the two text boxes
                                      Container(
                                        width: 40,
                                        height: 60,
                                        child: Center(
                                          child: Text(
                                            '500',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 60.0,
                            width: MediaQuery.of(context).size.width *
                                0.8, // Adjust the width as needed
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                // CustomPaint widget positioned
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: CustomPaint(
                                    painter: ThinCirclePaintergreen(),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Center(
                                        child: Text(
                                          'F',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Column widget positioned
                                Positioned(
                                  left:
                                      60, // 40 (width of the circle) + 10 (space) + 10 (left margin)
                                  top:
                                      10, // Aligning it with the top of the circle
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 15,
                                        child: Center(
                                          child: Text(
                                            'Sushil Kumar',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left:
                                                10.0), // Space between the two text containers
                                        child: Container(
                                          width: 40,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              'You owe',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  left:
                                      230, // Adjust this value based on the desired position
                                  top: 10,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          width: 5,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              '₹',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              15), // Space between the two text boxes
                                      Container(
                                        width: 40,
                                        height: 60,
                                        child: Center(
                                          child: Text(
                                            '500',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //YAHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 60.0,
                            width: MediaQuery.of(context).size.width *
                                0.8, // Adjust the width as needed
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                // CustomPaint widget positioned
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: CustomPaint(
                                    painter: ThinCirclePainter(),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Center(
                                        child: Text(
                                          'S',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Column widget positioned
                                Positioned(
                                  left:
                                      60, // 40 (width of the circle) + 10 (space) + 10 (left margin)
                                  top:
                                      10, // Aligning it with the top of the circle
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 15,
                                        child: Center(
                                          child: Text(
                                            'Sushil Kumar',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left:
                                                10.0), // Space between the two text containers
                                        child: Container(
                                          width: 40,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              'You owe',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  left:
                                      230, // Adjust this value based on the desired position
                                  top: 10,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          width: 5,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              '₹',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              15), // Space between the two text boxes
                                      Container(
                                        width: 40,
                                        height: 60,
                                        child: Center(
                                          child: Text(
                                            '500',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

CustomPainter createCirclePainter() {
  return _CirclePainter();
}

class _CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5; // Adjust border thickness as needed

    // Draw left border (red)
    paint.color = Colors.red;
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      -1.5, // Start angle (top)
      3.14, // Sweep angle (half circle)
      false,
      paint,
    );

    // Draw right border (green)
    paint.color = const Color.fromARGB(255, 34, 99, 37);
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      1.65, // Start angle (bottom)
      3.14, // Sweep angle (half circle)
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // This case, repaint logic isn't needed
  }
}

class SeventhPage extends StatelessWidget {
  const SeventhPage({Key? key}) : super(key: key);
  void _incrementCounter() {
    // Implement your logic for the floating action button press
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(76, 187, 155, 1.0) // Fully opaque
        ,
        leading: Theme(
          data: ThemeData(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ), // Set icon color to white
          ),
          child: IconButton(
            icon: const Icon(Icons.menu), // Hamburger icon
            onPressed: () {
              // Handle menu button press
            },
          ),
        ),
        title: const Text(
          'SPLITWISE',
          style: TextStyle(
            color: Colors.white,
          ), // Set title text color to white
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                right: 20.0), // Add padding to move the button to the left
            child: IconButton(
              icon:
                  const Icon(Icons.search, color: Colors.white), // Search icon
              onPressed: () {
                // Handle search button press
              },
            ),
          ),
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert), // Three dots icon
            onSelected: (item) {
              // Handle menu selection
            },
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Item 1'),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Item 2'),
              ),
            ],
          ),
        ],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      backgroundColor: Color.fromRGBO(76, 187, 155, 1.0) // Fully opaque
      ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Section
          Container(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image below Splitwise text
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 0.0),
                          Image.asset(
                            'assets/Icon.png', // Replace with your image asset path
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height *
                                0.1, // Adjust height as needed
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0, // Adjust this value to move the circle above
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.1,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: CustomPaint(
                            painter: createCirclePainter(),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 8, // Adjust this value to move the text up or down
                        left: 4,
                        right: 0,
                        child: Text(
                          'M',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:
                                Color.fromRGBO(76, 187, 155, 1.0), // Text color
                            fontSize: 28, // Adjust font size as needed
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container for three things
              ],
            ),
          ),

          // Container below Splitwise image
          const Positioned(
            top: 20, // Adjust this value to position the text below the circle
            left: 0,
            right: 0,
            child: Text(
              'Meha Bakliwal',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 16, // Adjust font size as needed
              ),
            ),
          ),
          // Container below Splitwise definition
          SizedBox(height: 16.0), // Adjust height as needed
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10.0),
                              Text(
                                'You are owed',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14.0, // Customize the font size
                                ), // Apply the Lato regular style
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Text(
                                    '₹ ',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 12.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                  Text(
                                    ' 1500',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 24.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            'assets/rect.png', // Replace with your image asset path
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height *
                                0.1, // Adjust height as needed
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10.0),
                              Text(
                                'You owe',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14.0, // Customize the font size
                                ), // Apply the Lato regular style
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Text(
                                    '₹ ',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 12.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                  Text(
                                    ' 750',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 24.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                          SizedBox(width: 10.0),
                          Image.asset(
                            'assets/rect.png', // Replace with your image asset path
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height *
                                0.1, // Adjust height as needed
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10.0),
                              Text(
                                'Total Balance',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14.0, // Customize the font size
                                ), // Apply the Lato regular style
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Text(
                                    '₹ ',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 12.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                  Text(
                                    ' 750',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 24.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              // Add child widgets as needed
              child: Stack(
                children: [
                  Positioned(
                    top: 10.0,
                    left: 4,
                    right: 4,
                    // Adjust the top position as needed
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Handle button press
                            Navigator.pushNamed(context, '/sixthPage');
                          },
                          child: Text('FRIENDS'),
                        ),
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                // Handle button press
                              },
                              child: Text('GROUPS'),
                            ),
                            Image.asset(
                              'assets/line.png', // Replace with your image asset path
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height *
                                  0.003, // Adjust height as needed
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle button press
                            Navigator.pushNamed(context, '/eighthPage');
                          },
                          child: Text('ACTIVITY'),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 38.0,
                      left: 4,
                      right: 4,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 60.0,
                            width: MediaQuery.of(context).size.width *
                                0.8, // Adjust the width as needed
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                // CustomPaint widget positioned
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: CustomPaint(
                                    painter: ThinCirclePainter(),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Center(
                                        child: Image.asset(
                                          'assets/mountain.png', // Replace with your image asset path
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02, // Adjust height as needed
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Column widget positioned
                                Positioned(
                                  left:
                                      60, // 40 (width of the circle) + 10 (space) + 10 (left margin)
                                  top:
                                      10, // Aligning it with the top of the circle
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 15,
                                        child: Center(
                                          child: Text(
                                            'Sushil Kumar',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left:
                                                10.0), // Space between the two text containers
                                        child: Container(
                                          width: 40,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              'You owe',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  left:
                                      230, // Adjust this value based on the desired position
                                  top: 10,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          width: 5,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              '₹',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              15), // Space between the two text boxes
                                      Container(
                                        width: 40,
                                        height: 60,
                                        child: Center(
                                          child: Text(
                                            '500',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 60.0,
                            width: MediaQuery.of(context).size.width *
                                0.8, // Adjust the width as needed
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                // CustomPaint widget positioned
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: CustomPaint(
                                    painter: ThinCirclePaintergreen(),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Center(
                                        child: Image.asset(
                                          'assets/video.png', // Replace with your image asset path
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02, // Adjust height as needed
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Column widget positioned
                                Positioned(
                                  left:
                                      60, // 40 (width of the circle) + 10 (space) + 10 (left margin)
                                  top:
                                      10, // Aligning it with the top of the circle
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 15,
                                        child: Center(
                                          child: Text(
                                            'Sushil Kumar',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left:
                                                10.0), // Space between the two text containers
                                        child: Container(
                                          width: 40,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              'You owe',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  left:
                                      230, // Adjust this value based on the desired position
                                  top: 10,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          width: 5,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              '₹',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              15), // Space between the two text boxes
                                      Container(
                                        width: 40,
                                        height: 60,
                                        child: Center(
                                          child: Text(
                                            '500',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 60.0,
                            width: MediaQuery.of(context).size.width *
                                0.8, // Adjust the width as needed
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                // CustomPaint widget positioned
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: CustomPaint(
                                    painter: ThinCirclePaintergreen(),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Center(
                                        child: Image.asset(
                                          'assets/fork.png', // Replace with your image asset path
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02, // Adjust height as needed
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Column widget positioned
                                Positioned(
                                  left:
                                      60, // 40 (width of the circle) + 10 (space) + 10 (left margin)
                                  top:
                                      10, // Aligning it with the top of the circle
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 15,
                                        child: Center(
                                          child: Text(
                                            'Sushil Kumar',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left:
                                                10.0), // Space between the two text containers
                                        child: Container(
                                          width: 40,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              'You owe',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  left:
                                      230, // Adjust this value based on the desired position
                                  top: 10,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          width: 5,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              '₹',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              15), // Space between the two text boxes
                                      Container(
                                        width: 40,
                                        height: 60,
                                        child: Center(
                                          child: Text(
                                            '500',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //YAHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 60.0,
                            width: MediaQuery.of(context).size.width *
                                0.8, // Adjust the width as needed
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                // CustomPaint widget positioned
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: CustomPaint(
                                    painter: ThinCirclePainter(),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Center(
                                        child: Image.asset(
                                          'assets/mountain.png', // Replace with your image asset path
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02, // Adjust height as needed
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Column widget positioned
                                Positioned(
                                  left:
                                      60, // 40 (width of the circle) + 10 (space) + 10 (left margin)
                                  top:
                                      10, // Aligning it with the top of the circle
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0.0),
                                          child: Container(
                                            width: 110,
                                            height: 17,
                                            child: Center(
                                              child: Text(
                                                'Trip To Matheran',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left:
                                                0.0), // Space between the two text containers
                                        child: Container(
                                          width: 120,
                                          height: 30,
                                          child: Center(
                                            child: Text(
                                              'You owe Sushil Kumar',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  left:
                                      230, // Adjust this value based on the desired position
                                  top: 10,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          width: 5,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              '₹',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              15), // Space between the two text boxes
                                      Container(
                                        width: 40,
                                        height: 60,
                                        child: Center(
                                          child: Text(
                                            '500',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EighthPage extends StatelessWidget {
  const EighthPage({Key? key}) : super(key: key);
  void _incrementCounter() {
    // Implement your logic for the floating action button press
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(76, 187, 155, 1.0) // Fully opaque
        ,
        leading: Theme(
          data: ThemeData(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ), // Set icon color to white
          ),
          child: IconButton(
            icon: const Icon(Icons.menu), // Hamburger icon
            onPressed: () {
              // Handle menu button press
            },
          ),
        ),
        title: const Text(
          'SPLITWISE',
          style: TextStyle(
            color: Colors.white,
          ), // Set title text color to white
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                right: 20.0), // Add padding to move the button to the left
            child: IconButton(
              icon:
                  const Icon(Icons.search, color: Colors.white), // Search icon
              onPressed: () {
                // Handle search button press
              },
            ),
          ),
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert), // Three dots icon
            onSelected: (item) {
              // Handle menu selection
            },
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Item 1'),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Item 2'),
              ),
            ],
          ),
        ],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      backgroundColor: Color.fromRGBO(76, 187, 155, 1.0) // Fully opaque
      ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Section
          Container(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image below Splitwise text
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 0.0),
                          Image.asset(
                            'assets/Icon.png', // Replace with your image asset path
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height *
                                0.1, // Adjust height as needed
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0, // Adjust this value to move the circle above
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.1,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: CustomPaint(
                            painter: createCirclePainter(),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 8, // Adjust this value to move the text up or down
                        left: 4,
                        right: 0,
                        child: Text(
                          'M',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:
                                Color.fromRGBO(76, 187, 155, 1.0), // Text color
                            fontSize: 28, // Adjust font size as needed
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container for three things
              ],
            ),
          ),

          // Container below Splitwise image
          const Positioned(
            top: 20, // Adjust this value to position the text below the circle
            left: 0,
            right: 0,
            child: Text(
              'Meha Bakliwal',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 16, // Adjust font size as needed
              ),
            ),
          ),
          // Container below Splitwise definition
          SizedBox(height: 16.0), // Adjust height as needed
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10.0),
                              Text(
                                'You are owed',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14.0, // Customize the font size
                                ), // Apply the Lato regular style
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Text(
                                    '₹ ',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 12.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                  Text(
                                    ' 1500',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 24.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            'assets/rect.png', // Replace with your image asset path
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height *
                                0.1, // Adjust height as needed
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10.0),
                              Text(
                                'You owe',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14.0, // Customize the font size
                                ), // Apply the Lato regular style
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Text(
                                    '₹ ',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 12.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                  Text(
                                    ' 750',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 24.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                          SizedBox(width: 10.0),
                          Image.asset(
                            'assets/rect.png', // Replace with your image asset path
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height *
                                0.1, // Adjust height as needed
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10.0),
                              Text(
                                'Total Balance',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14.0, // Customize the font size
                                ), // Apply the Lato regular style
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Text(
                                    '₹ ',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 12.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                  Text(
                                    ' 750',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 24.0, // Customize the font size
                                    ), // Apply the Lato bold style
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              // Add child widgets as needed
              child: Stack(
                children: [
                  Positioned(
                    top: 10.0,
                    left: 4,
                    right: 4,
                    // Adjust the top position as needed
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Handle button press
                            Navigator.pushNamed(context, '/sixthPage');
                          },
                          child: Text('FRIENDS'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle button press
                            Navigator.pushNamed(context, '/seventhPage');
                          },
                          child: Text('GROUPS'),
                        ),
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                // Handle button press
                              },
                              child: Text('ACTIVITY'),
                            ),
                            Image.asset(
                              'assets/line.png', // Replace with your image asset path
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height *
                                  0.003, // Adjust height as needed
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 38.0,
                      left: 4,
                      right: 4,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 60.0,
                            width: MediaQuery.of(context).size.width *
                                0.8, // Adjust the width as needed
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                // CustomPaint widget positioned
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(236, 236, 236,
                                          1.0), // Set the background color to grey
                                      shape: BoxShape
                                          .circle, // Make the container circular
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/fries.png', // Replace with your image asset path
                                        fit: BoxFit.cover,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02, // Adjust height as needed
                                      ),
                                    ),
                                  ),
                                ),

                                // Column widget positioned
                                Positioned(
                                  left:
                                      60, // 40 (width of the circle) + 10 (space) + 10 (left margin)
                                  top:
                                      10, // Aligning it with the top of the circle
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Container(
                                          width: 90,
                                          height: 15,
                                          child: Center(
                                            child: Text(
                                              'You Added Fries',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left:
                                                15.0), // Space between the two text containers
                                        child: Container(
                                            width: 140,
                                            height: 20,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Shobhit B. owes you',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  left:
                                      230, // Adjust this value based on the desired position
                                  top: 10,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          width: 5,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              '',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              15), // Space between the two text boxes
                                      Container(
                                        width: 40,
                                        height: 60,
                                        child: Center(
                                          child: Text(
                                            '',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 60.0,
                            width: MediaQuery.of(context).size.width *
                                0.8, // Adjust the width as needed
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                // CustomPaint widget positioned
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(236, 236, 236,
                                          1.0), // Set the background color to grey
                                      shape: BoxShape
                                          .circle, // Make the container circular
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/video.png', // Replace with your image asset path
                                        fit: BoxFit.cover,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02, // Adjust height as needed
                                      ),
                                    ),
                                  ),
                                ),

                                // Column widget positioned
                                Positioned(
                                  left:
                                      60, // 40 (width of the circle) + 10 (space) + 10 (left margin)
                                  top:
                                      10, // Aligning it with the top of the circle
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Container(
                                          width: 210,
                                          height: 35,
                                          child: Center(
                                            child: Text(
                                              'Shobhit B. added to the group    ”Movie Night”',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  left:
                                      230, // Adjust this value based on the desired position
                                  top: 10,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          width: 5,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              '',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              15), // Space between the two text boxes
                                      Container(
                                        width: 40,
                                        height: 60,
                                        child: Center(
                                          child: Text(
                                            '',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 60.0,
                            width: MediaQuery.of(context).size.width *
                                0.8, // Adjust the width as needed
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                // CustomPaint widget positioned
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(236, 236, 236,
                                          1.0), // Set the background color to grey
                                      shape: BoxShape
                                          .circle, // Make the container circular
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/mountain.png', // Replace with your image asset path
                                        fit: BoxFit.cover,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02, // Adjust height as needed
                                      ),
                                    ),
                                  ),
                                ),

                                // Column widget positioned
                                Positioned(
                                  left:
                                      60, // 40 (width of the circle) + 10 (space) + 10 (left margin)
                                  top:
                                      10, // Aligning it with the top of the circle
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Container(
                                          width: 205,
                                          height: 35,
                                          child: Center(
                                            child: Text(
                                              'You added Shubham to the group     ”Trip To Lonavala”',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left:
                                                10.0), // Space between the two text containers
                                        child: Container(
                                          width: 40,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              '',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  left:
                                      230, // Adjust this value based on the desired position
                                  top: 10,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          width: 5,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              '',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              15), // Space between the two text boxes
                                      Container(
                                        width: 40,
                                        height: 60,
                                        child: Center(
                                          child: Text(
                                            '',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //YAHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 60.0,
                            width: MediaQuery.of(context).size.width *
                                0.8, // Adjust the width as needed
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                // CustomPaint widget positioned
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(236, 236, 236,
                                          1.0), // Set the background color to grey
                                      shape: BoxShape
                                          .circle, // Make the container circular
                                    ),
                                    child: Center(
                                      child: Text(
                                        'S',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // Column widget positioned
                                Positioned(
                                  left:
                                      50, // 40 (width of the circle) + 10 (space) + 10 (left margin)
                                  top:
                                      10, // Aligning it with the top of the circle
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 220,
                                        height: 18,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25.0),
                                            child: Text(
                                              'You settled up with Sushil Kumar',
                                              style: TextStyle(
                                                color: Color.fromRGBO(97, 97,
                                                    97, 1.0), // Fully opaque

                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Space between the two text containers
                                      Container(
                                        width: 120,
                                        height: 30,
                                        child: Center(
                                          child: Text(
                                            'You paid ₹500',
                                            style: TextStyle(
                                              color: Color.fromRGBO(130, 125,
                                                  125, 1.0), // Fully opaque

                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  left:
                                      230, // Adjust this value based on the desired position
                                  top: 10,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          width: 5,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              '',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              15), // Space between the two text boxes
                                      Container(
                                        width: 40,
                                        height: 60,
                                        child: Center(
                                          child: Text(
                                            '',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThinCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    paint.color = Colors.red;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ThinCirclePaintergreen extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    paint.color = Colors.green;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
