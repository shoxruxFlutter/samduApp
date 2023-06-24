
import 'package:samduapp/constant.dart';
import 'package:flutter/material.dart';
import 'package:samduapp/models/api_response.dart';
import 'package:samduapp/models/fakulet.dart';
import 'package:samduapp/screens/kafedralar/kafedralar.dart';

import '../services/fakultet_service.dart';
import '../services/user_service.dart';
import 'login.dart';

// import 'kafedralar/biologiya/biologiya.dart';
// import 'kafedralar/filologiya/filologiya.dart';
// import 'kafedralar/geografiya/geografiya.dart';
// import 'kafedralar/insonResurslari/insonResurslari.dart';
// import 'kafedralar/it/it.dart';
// import 'kafedralar/kimyo/kimyo.dart';
// import 'kafedralar/matematika/matematika.dart';
// import 'kafedralar/mt/mt.dart';
// import 'kafedralar/psixologiya/psixologiya.dart';
// import 'kafedralar/sport/sport.dart';
// import 'kafedralar/tarix/tarix.dart';
// import 'kafedralar/yuridik/yuridik.dart';




class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
    List<dynamic> _fakultetList = [];
//    List<Widget> page = [
//     const Matematika(titleKafedra: '',),
//     const Biologiya(),
//     const Geografiya(),
//     const Tarix(),
//     const Psixologiya(),
//     const Kimyo(),
//     const It(),
//     const Yuridik(),
//     const Filologiya(),
//     const MT(),
//     const Sport(),
//     const InsonResurslari(),    
//  ];

    // get all fakultet
  Future<void> getFakultetAll() async {
    // userId = await getUserId();

  ApiResponse response = await getFakultet();

    if(response.error == null){
      setState(() {
        _fakultetList = response.data as List<dynamic>;

        // _loading = _loading ? !_loading : _loading;
      });
    }
    else if (response.error == unauthorized){
      logout().then((value) => {
         Navigator.of(context).pushReplacementNamed('/login')
      });
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
      ));
    }
  }



var kafedralar = [
        ["Mаtematik tahlil kafedrasi", "Algebra va geometriya kafedrasi", "Ehtimollar nazariyasi va matematik statistika kafedrasi", "Differensial tenglamalar kafedrasi", "Matematik fizika va funksional analiz", "Nazariy va amaliy mexanika kafedrasi"],
        ["Botanika kafedrasi", 'Zoologiya kafedrasi', "O'simliklar fiziologiyasi va mikrobiologiya kafedrasi", 'Odam va hayvonlar fiziologiyasi va biokimyo kafedrasi', 'Genetika va biotexnologiya kafedrasi'],
        ["Geografiya va tabiiy resurslar kafedrasi", 'Ijtimoiy - iqtisodiy geografiya kafedrasi', 'Gidrometeorologiya kafedrasi', 'Ekologiya va hayot faoliyati xavfsizligi kafedrasi', 'Masofaviy zondlash va GIS dasturlari markazi kafedrasi'],
        
        ["O'zbekiston tarixi kafedrasi", 'Arxeologiya kafedrasi', 'Jahon tarixi kafedrasi', 'Tarixshunoslik va manbashunoslik kafedrasi', 'Samarqand tamadduni tarixi'],
        ['Psixologiya nazariyasi va amaliyoti kafedrasi', 'Umumiy psixologiya kafedrasi', 'Sotsiologiya va ijtimoiy ish kafedrasi'],
        ['Organik sintez va bioorganik kimyo kafedrasi', 'Noorganik kimyo va materialshunoslik kafedrasi', 'Fizikaviy va kolloid kimyo kafedrasi', 'Analitik kimyo kafedrasi',  'Polimerlar kimyosi va kimyoviy texnologiya'],
       
        ['Matematik modellashtirish kafedrasi', 'Kompyuter ilmlari va texnologiyalari fanlari kafedrasi', 'Axborotlashtirish texnologiyalari kafedrasi', 'Dasturiy injiniring kafedrasi'],
        ['Huquqshunoslik va huquq ta’limi kafedrasi', "Falsafa va milliy g'oya kafedrasi"],
        ['Mumtoz adabiyot tarixi kafedrasi', "O‘zbek tilshunosligi kafedrasi", 'Istiqlol davri adabiyoti va adabiyot nazariyasi kafedrasi', "O‘zbek tili va adabiyoti kafedrasi", 'Tojik filologiyasi va xorijiy sharq tillari', 'Rus filologiyasi', 'Ingliz tili', 'Roman-german tillari'],
        
        ["Maktabgacha ta'lim", "Boshlang'ich va texnologik ta'lim", 'Fakultetlararo pedagogika'],
        ['Sport faoliyati', "San'atshunoslik", 'Fakultetlararo jismoniy madaniyat'],
        ['Inson resurslarini boshqarish kafedrasi', 'Raqamli iqtisodiyot kafedrasi', 'Tarmoqlar iqtisodiyoti kafedrasi'],
];
var images = [
    "assets/images/mathematics.png",
    "assets/images/biological.png",
    "assets/images/geography.png",
    "assets/images/history.png",
    "assets/images/psychology.png",
    "assets/images/chemistry.png",
    "assets/images/it.png",
    "assets/images/juridical.png",
    "assets/images/philology.png",
    "assets/images/preschool.png",
    "assets/images/sport.png",
    "assets/images/control.png",
  ];

var doc = [
  [['Anvar', 'Akmal'], ['Anvar1', 'Akmal1'], ['Anvar2', 'Akmal2'], ['Anvar3', 'Akmal3'], ['Anvar4', 'Akmal4'], ['Anvar5', 'Akmal5'],],
  [['Anvar', 'Akmal'], ['Anvar1', 'Akmal1'], ['Anvar2', 'Akmal2'], ['Anvar3', 'Akmal3'], ['Anvar4', 'Akmal4']],
  [['Anvar', 'Akmal'], ['Anvar1', 'Akmal1'], ['Anvar2', 'Akmal2'], ['Anvar3', 'Akmal3'], ['Anvar4', 'Akmal4']],
  [['Anvar', 'Akmal'], ['Anvar1', 'Akmal1'], ['Anvar2', 'Akmal2'], ['Anvar3', 'Akmal3'], ['Anvar4', 'Akmal4']],
  [['Anvar', 'Akmal'], ['Anvar1', 'Akmal1'], ['Anvar2', 'Akmal2']],
  [['Anvar', 'Akmal'], ['Anvar1', 'Akmal1'], ['Anvar2', 'Akmal2'], ['Anvar3', 'Akmal3'], ['Anvar4', 'Akmal4']],
  [['Lutfullayev Maxmud Xasanovich', 'Akmal'], ['Lutfullayev Maxmud Xasanovich', 'Akmal1'], ['Anvar2', 'Akmal2'], ['Anvar3', 'Akmal3']],
  [['Anvar', 'Akmal'], ['Anvar1', 'Akmal1']],
  [['Anvar', 'Akmal'], ['Anvar1', 'Akmal1'], ['Anvar2', 'Akmal2'], ['Anvar3', 'Akmal3'], ['Anvar4', 'Akmal4']],
  [['Anvar', 'Akmal'], ['Anvar1', 'Akmal1'], ['Anvar2', 'Akmal2']],
  [['Anvar', 'Akmal'], ['Anvar1', 'Akmal1'], ['Anvar2', 'Akmal2']],
  [['Anvar', 'Akmal'], ['Anvar1', 'Akmal1'], ['Anvar2', 'Akmal2']]];
  
    @override
  void initState() {
    getFakultetAll();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: _fakultetList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height/2.0)
        ),
        itemBuilder: (BuildContext context, int index){
           Fakultet fakultet = _fakultetList[index];
          return Card(
            child: InkWell(
              onTap: ()=> Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Kafedralar(screenTitle: fakultet.title, listKafedra: kafedralar[index], kafedraDoc: doc[index], fakultetId: fakultet.id,)),
                ),
              splashColor: Colors.blue,
              child: 
                Column(
                  children: <Widget>[
                  const SizedBox(height: 10,),
                  Image.asset(images[index], height: 64, width: 64,),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(fakultet.title, style: const TextStyle(fontSize: 16, fontFamily: "Avenir", color: Colors.black, height: 1.2, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                  )
                ]),
            ),
          );
        },
        ),
    );
  }
}