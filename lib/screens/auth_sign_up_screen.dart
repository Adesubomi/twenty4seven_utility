import 'package:flutter/material.dart';
import 'package:twenty4seven_utility/screens/auth_setup_screen.dart';

class AuthSignUpScreen extends StatelessWidget {

	static const String routeName = "sign-up";

	Widget build(BuildContext context) {

		return Scaffold(
			floatingActionButton: Row(
				mainAxisAlignment: MainAxisAlignment.end,
				children: [
					Padding(
						padding: EdgeInsets.only(right: 16.0),
						child: RaisedButton(
							child: Text("Submit"),
							onPressed: () => Navigator.of(context).pushNamed( AuthSetupScreen.routeName ),
						),
					),
				]
			),
			body: SafeArea(
				child: SingleChildScrollView(
					child: Padding(
						padding: EdgeInsets.symmetric(
							horizontal: 32.0
						),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.stretch,
							children: [

								SizedBox(height: 48.0),

								Text(
									"Welcome",
									textAlign: TextAlign.center,
								),
								Text(
									"Sign Up",
									textAlign: TextAlign.center,
									style: TextStyle(
										fontSize: 40.0,
										fontWeight: FontWeight.w300,
									)
								),

								SizedBox(height: 48.0),

								Row(
									children: [
										Expanded(
											child: TextField(
											  decoration: InputDecoration(
											    border: OutlineInputBorder(),
											    labelText: 'First name',
											  ),
											),
										),

										SizedBox( width: 24.0 ),

										Expanded(
											child: TextField(
											  decoration: InputDecoration(
											    border: OutlineInputBorder(),
											    labelText: 'Last name',
											  ),
										  ),
										),
									]
								),

								SizedBox(height: 48.0),

								TextField(
									keyboardType: TextInputType.phone,
								  decoration: InputDecoration(
								    border: OutlineInputBorder(),
								    labelText: 'Phone number',
								  ),
							  ),

								SizedBox(height: 48.0),

								TextField(
									keyboardType: TextInputType.emailAddress,
								  decoration: InputDecoration(
								    border: OutlineInputBorder(),
								    labelText: 'Email address',
								  ),
							  ),

								SizedBox(height: 48.0),

								TextField(
									obscureText: true,
								  decoration: InputDecoration(
								    border: OutlineInputBorder(),
								    labelText: 'Password',
								  ),
							  ),


								//Row(
								//	mainAxisSize: MainAxisSize.min,
								//	children: [
								//		TextField(),
								//		SizedBox(height: 16.0),
								//		TextField(),
								//	]
								//),

								//Padding(
									//padding: EdgeInsets.symmetric(
									//	horizontal: 32.0
									//),
									//child: Row(
										//mainAxisSize: MainAxisSize.max,
								//		children: [
								//			TextField(),
								//			SizedBox(height: 16.0),
								//			TextField(),
								//		]
								//	),
								//),
							]
						),
					),
				),
			),
		);
	}
}