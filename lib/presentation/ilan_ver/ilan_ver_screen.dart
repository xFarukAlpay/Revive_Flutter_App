import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/ilan_ver_bloc.dart';
import 'models/ilan_ver_model.dart';

class IlanVerScreen extends StatelessWidget {
  const IlanVerScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<IlanVerBloc>(
      create: (context) => IlanVerBloc(
        IlanVerState(IlanVerModelObj: IlanVerModel()),
      )..add(IlanverInitialEvent()),
      child: IlanVerScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IlanVerBody(),
      ),
    );
  }
}

class IlanVerBody extends StatefulWidget {
  @override
  _IlanVerBodyState createState() => _IlanVerBodyState();
}

class _IlanVerBodyState extends State<IlanVerBody> {
  List<int> selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              "Kategori Seçiniz",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                List<String> items = [
                  "Kitaplar",
                  "Defterler",
                  "Kalemler",
                  "Silgiler",
                  "Çantalar",
                  "Klasörler",
                  "Not Kağıtları",
                  "Ajandalar",
                  "Dosyalar",
                  "Maket Bıçakları"
                ];
                return _buildOptionButton(context, items[index], index);
              },
            ),
          ),
          SizedBox(height: 16.0),
          _buildSubmitButton(context),
        ],
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, String title, int index) {
    final isSelected = selectedIndexes.contains(index);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isSelected) {
              selectedIndexes.remove(index);
            } else {
              selectedIndexes.add(index);
            }
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blueAccent : Colors.white,
            borderRadius: BorderRadius.circular(0), // Kenar yumuşatma kaldırıldı
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
          child: Center(
            child: Row(
              children: [
                Icon(
                  isSelected ? Icons.check_circle : Icons.circle_outlined,
                  color: isSelected ? Colors.white : Colors.black54,
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.symmetric(vertical: 14.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        elevation: 2,
      ),
      onPressed: () {
        if (selectedIndexes.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Seçimler onaylandı: ${selectedIndexes.join(", ")}")),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Lütfen en az bir kategori seçiniz.")),
          );
        }
      },
      child: Center(
        child: Text(
          "Onayla",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
