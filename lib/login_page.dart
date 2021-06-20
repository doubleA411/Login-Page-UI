import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _buildEmailLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: GoogleFonts.montserrat(
            textStyle: kEmailTextStyle,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerRight,
          decoration: kLabelStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 25.0),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                  child: Icon(Icons.email),
                ),
                hintText: "Enter your email",
                hintStyle: TextStyle(color: Colors.black54)),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: GoogleFonts.montserrat(
            textStyle: kEmailTextStyle,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerRight,
          decoration: kLabelStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 25.0),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                  child: Icon(Icons.lock),
                ),
                hintText: "Enter your Password",
                hintStyle: TextStyle(color: Colors.black54)),
          ),
        ),
      ],
    );
  }

  Widget _buildFP() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print("Forgot password"),
        padding: EdgeInsets.only(right: 10.0, top: 10.0),
        child: Text(
          "Forgot Password?",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRememberMe() {
    bool _rememberMe = false;
    return Container(
      height: 20.0,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (bool? value) {
                setState(
                  () {
                    _rememberMe = value!;
                  },
                );
              },
            ),
          ),
          Text(
            "Remember Me",
            style: GoogleFonts.montserrat(
              textStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print("Login"),
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.white,
        child: Text(
          "LOGIN",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
                fontSize: 18.0),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInOp() {
    return Column(
      children: [
        Text(
          "- OR -",
          style: GoogleFonts.montserrat(
            textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Sign in with",
          style: GoogleFonts.montserrat(
            textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildOps(String url) {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 2), blurRadius: 6.0),
          ],
          image: DecorationImage(
            image: NetworkImage(url),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFC5C7D),
                      Color(0xFF6A82FB),
                    ],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign In",
                        style: GoogleFonts.montserrat(textStyle: kSignInStyle),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildEmailLabel(),
                      SizedBox(height: 30.0),
                      _buildPasswordLabel(),
                      _buildFP(),
                      _buildRememberMe(),
                      _buildLoginBtn(),
                      _buildSignInOp(),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildOps(
                              "https://1000logos.net/wp-content/uploads/2021/04/Facebook-logo.png"),
                          _buildOps(
                              "https://blog.hubspot.com/hubfs/image8-2.jpg"),
                          _buildOps(
                              "https://lh3.googleusercontent.com/proxy/CG5TPKfbWqbAZIHwFXifIgmCaGOT3PgGTezmnmmRbQH77nkj7iRuPfCGH32BOnXLKs57F6jkglGo0rSZmBMnpAqHWsfQd9vXdnaP3cqp1_rEls6uDYYp_A"),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don\'t have an account? ",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: "Sign Up",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
