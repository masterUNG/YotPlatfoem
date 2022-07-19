import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yotplatform/utility/my_constant.dart';
import 'package:yotplatform/widgets/show_button.dart';
import 'package:yotplatform/widgets/show_form.dart';
import 'package:yotplatform/widgets/show_icon_button.dart';
import 'package:yotplatform/widgets/show_progress.dart';
import 'package:yotplatform/widgets/show_text.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var typeUsers = MyConstant.typeUsers;
  String? typeUser;
  double? lat, lng;

  @override
  void initState() {
    super.initState();
    findLatLang();
  }

  Future<void> findLatLang() async {
    Position? position = await findPosition();
    if (position != null) {
      lat = position.latitude;
      lng = position.longitude;
      print('lat = $lat, lng = $lng');
      setState(() {});
    }
  }

  Future<Position?> findPosition() async {
    Position? position;

    try {
      position = await Geolocator.getCurrentPosition();
    } catch (e) {
      position = null;
    }

    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newAppBar(),
      body: ListView(
        children: [
          newGeteral(),
          formName(),
          dropDownType(),
          formEmail(),
          formPassword(),
          newLocation(),
          newMap(),
          buttonCreateAccount(),
        ],
      ),
    );
  }

  Row buttonCreateAccount() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 250,margin: const EdgeInsets.only(top: 16),
              child: ShowButton(
                label: 'Create New Account',
                pressFunc: () {},
              ),
            ),
          ],
        );
  }

  Row newMap() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: lat == null
              ? const ShowProgress()
              : GoogleMap(
                  markers: <Marker>[
                    Marker(
                      markerId: MarkerId('id'),
                      position: LatLng(lat!, lng!),
                      infoWindow: InfoWindow(
                          title: 'You Here ?',
                          snippet: 'lat = $lat, lng = $lng'),
                    ),
                  ].toSet(),
                  initialCameraPosition: CameraPosition(
                    target: LatLng(lat!, lng!),
                    zoom: 16,
                  ),
                  onMapCreated: (controller) {},
                ),
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          width: 250,
          height: 250,
        ),
      ],
    );
  }

  Container newLocation() {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
      child: ShowText(
        text: 'Location:',
        textStyle: MyConstant().h2Style(),
      ),
    );
  }

  Row dropDownType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          width: 250,
          height: 50,
          child: DropdownButton<dynamic>(
            isExpanded: true,
            underline: const SizedBox(),
            hint: ShowText(
              text: 'Please Choose Type User',
              textStyle: MyConstant().h3ActiveStyle(),
            ),
            value: typeUser,
            items: typeUsers
                .map(
                  (e) => DropdownMenuItem(
                    child: ShowText(text: e),
                    value: e,
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                typeUser = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Row formPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowForm(
          hint: 'Password:',
          iconData: Icons.lock,
          changeFunc: (String string) {},
        ),
      ],
    );
  }

  Row formEmail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowForm(
          hint: 'Email:',
          iconData: Icons.mail,
          changeFunc: (String string) {},
        ),
      ],
    );
  }

  Row formName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowForm(
          hint: 'Display Name:',
          iconData: Icons.fingerprint,
          changeFunc: (String string) {},
        ),
      ],
    );
  }

  Container newGeteral() {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
      child: ShowText(
        text: 'General:',
        textStyle: MyConstant().h2Style(),
      ),
    );
  }

  AppBar newAppBar() {
    return AppBar(actions: [ShowIconButton(iconData: Icons.cloud_upload, pressFunc: (){})],
      title: ShowText(
        text: 'Create New Account',
        textStyle: MyConstant().h2Style(),
      ),
      foregroundColor: MyConstant.dark,
      backgroundColor: MyConstant.primary,
    );
  }
}
