import 'package:flutter/material.dart';
import 'package:pokeapp/pokemon.dart';

class PokeDetail extends StatelessWidget {
  // const PokeDetail({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;
  PokeDetail({required this.pokemon});
  bodyWidget(BuildContext context)=>Stack(
    children: [
      Positioned(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width-20,
        left: 10,
        top: MediaQuery.of(context).size.height*0.1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(pokemon.name!,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
              Text("Height: ${pokemon.height}",style: TextStyle(backgroundColor: Colors.lightGreenAccent,fontSize: 20,fontStyle: FontStyle.italic),),
              Text("Weight: ${pokemon.weight}",style: TextStyle(backgroundColor: Colors.lightGreenAccent,fontSize: 20,fontStyle: FontStyle.italic),),
              Text("Types"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.type!.map((t)=>FilterChip(label: Text(t),backgroundColor: Colors.amber, onSelected: (b){})).toList(),
              ),
              Text("Weakness"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.weaknesses!.map((t)=>FilterChip(label: Text(t,style: TextStyle(color: Colors.white),),backgroundColor: Colors.amberAccent, onSelected: (b){})).toList(),
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(tag: pokemon.img!, child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(pokemon.img!),fit: BoxFit.cover),
          ),
        )),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        centerTitle: true,
        title: Text(pokemon.name!),
        backgroundColor: Colors.cyan,
        elevation: 0.0,
      ),
      body: bodyWidget(context),
    );
  }
}
