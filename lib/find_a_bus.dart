import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

class Person implements Comparable<Person> {
  final String name, surname;
  final int age;

  const Person(this.name, this.surname, this.age);

  @override
  int compareTo(Person other) => name.compareTo(other.name);
}

class SearchPageDemo extends StatelessWidget {
  const SearchPageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final people = [
      Person('Mike', 'Barron', 64),
      Person('Todd', 'Black', 30),
      Person('Ahmad', 'Edwards', 55),
      Person('Anthony', 'Johnson', 67),
      Person('Annette', 'Brooks', 39),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Start Location'),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];

          return ListTile(
            title: Text(person.name),
            subtitle: Text(person.surname),
            trailing: Text('${person.age} yo'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Select Start Location',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<Person>(
            onQueryUpdate: (query) => print(query), // Print the search query
            items: people,
            searchLabel: 'Search people',
            suggestion: const Center(
              child: Text('Filter people by name, surname, or age'),
            ),
            failure: const Center(
              child: Text('No Bus found :('),
            ),
            filter: (person) => [
              person.name,
              person.surname,
              person.age.toString(),
            ],
            sort: (a, b) => a.compareTo(b),
            builder: (person) => ListTile(
              title: Text(person.name),
              subtitle: Text(person.surname),
              trailing: Text('${person.age} yo'),
            ),
          ),
        ),
        child: const Icon(Icons.search),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SearchPageDemo(),
  ));
}
