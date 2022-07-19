import 'package:flutter/material.dart';
import 'package:yotplatform/states/create_account.dart';
import 'package:yotplatform/utility/my_constant.dart';
import 'package:yotplatform/widgets/show_button.dart';
import 'package:yotplatform/widgets/show_form.dart';
import 'package:yotplatform/widgets/show_image.dart';
import 'package:yotplatform/widgets/show_text.dart';

class Authen extends StatelessWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            newLogo(),
            newText(),
            formEmail(),
            formPassword(),
            newButton(context: context),
          ],
        ),
      )),
    );
  }

  Container newButton({required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: 250,
      child: Row(
        children: [
          Expanded(
            child: ShowButton(
              label: 'SignIn',
              pressFunc: () {},
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: ShowButton(
              label: 'SignUp',
              pressFunc: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateAccount(),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }

  ShowForm formPassword() {
    return ShowForm(
      hint: 'Password:',
      iconData: Icons.lock,
      changeFunc: (String string) {},
    );
  }

  ShowForm formEmail() {
    return ShowForm(
      hint: 'Email:',
      iconData: Icons.mail,
      changeFunc: (String string) {},
    );
  }

  ShowText newText() {
    return ShowText(
      text: 'Login:',
      textStyle: MyConstant().h1Style(),
    );
  }

  SizedBox newLogo() {
    return SizedBox(
      width: 100,
      child: ShowImage(),
    );
  }
}
