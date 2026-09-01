import 'package:api/API%20Note%20App/login%20or%20reg/Login/login_screen.dart';
import 'package:api/service/registation%20Service/registation.dart';
import 'package:flutter/material.dart';


class RegistationScreen extends StatefulWidget {
  const RegistationScreen({super.key});

  @override
  State<RegistationScreen> createState() => _RegistationScreenState();
}

class _RegistationScreenState extends State<RegistationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loding  = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passController= TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  Future<void> registation()async{


    setState(() {
      loding = true;
    });
    try{
      if(!mounted) return;
      var status =await RegistationService().registationApi(name: nameController.text.trim(), email: emailController.text.trim(), pass: passController.text.trim(), confirmPass: confirmPassController.text.trim());
      if(nameController.text.trim().isEmpty || emailController.text.trim().isEmpty || passController.text.trim().isEmpty || confirmPassController.text.trim().isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please fill in all fields"),
            backgroundColor: Colors.redAccent,
          ),
        );

        return;
      }
      if(passController.text != confirmPassController.text){

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password Don't match"),
            backgroundColor: Colors.redAccent,
          ),
        );
        return;
      }
      if(status !=null){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("user created successfully!"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("user created failed"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }catch(error){
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed: ${error.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }finally{
      if(mounted){
        setState(() {
          loding = false;
        });
      }
    }
  }
  @override
  void initState() {

    super.initState();
  }
  bool isPassworld = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        }, icon:Icon(Icons.arrow_back)
        ),
        toolbarHeight: 30,
      ),
      body: ListView(
        padding: EdgeInsetsGeometry.all(15),
        children: [
          SizedBox(height: 10,),
          Text("Wellcome Back.",style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1.5
          ),),
          Text("Let's sign up",style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.7),
              letterSpacing: 1.2
          ),),
          SizedBox(height: 40,),
          Column(
            children: [
              // Name
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    size: 28,
                  ),
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Email
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                  ),
                  hintText: "E-mail",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Password
              TextField(
                controller: passController,
                obscureText: !isPassworld,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPassworld = !isPassworld;
                      });
                    },
                    icon: Icon(
                      isPassworld
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Confirm Password
              TextField(
                controller: confirmPassController,
                obscureText: !isPassworld,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPassworld = !isPassworld;
                      });
                    },
                    icon: Icon(
                      isPassworld
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Column(
            children: [
              Container(
                height: 55,
                width: double.infinity,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.redAccent,
                ),
                child: TextButton(onPressed: loding ? null : registation,
                  child: Text("Sign Up",style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),
              ),
            ],
          ),
          SizedBox(height: 150,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dont't have an account ?",style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
              ),),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
                  child: Text("Log In!",style: TextStyle(
                      fontSize: 15,
                      color: Colors.red
                  ),)
              )
            ],
          ),
        ],
      ),
    );
  }
}