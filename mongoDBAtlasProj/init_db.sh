#!/bin/bash

echo "Warte 10 Sekunden, bis Cluster bereit ist..."
sleep 10

echo "Verbinde mit MongoDB..."
mongosh "${MONGO_URI}/Kunden" --eval "
  db.createCollection('users');
  
  db.users.insertMany([
    {
      name: 'Max Mustermann',
      email: 'max.mustermann@example.com',
      age: 28,
      city: 'Berlin',
      created_at: new Date(),
      status: 'active'
    },
    {
      name: 'Anna Schmidt',
      email: 'anna.schmidt@example.com',
      age: 34,
      city: 'München',
      created_at: new Date(),
      status: 'active'
    },
    {
      name: 'Peter Weber',
      email: 'peter.weber@example.com',
      age: 42,
      city: 'Hamburg',
      created_at: new Date(),
      status: 'inactive'
    },
    {
      name: 'Lisa Müller',
      email: 'lisa.mueller@example.com',
      age: 25,
      city: 'Frankfurt',
      created_at: new Date(),
      status: 'active'
    },
    {
      name: 'Thomas Klein',
      email: 'thomas.klein@example.com',
      age: 31,
      city: 'Köln',
      created_at: new Date(),
      status: 'active'
    },
    {
      name: 'Julia Wagner',
      email: 'julia.wagner@example.com',
      age: 29,
      city: 'Stuttgart',
      created_at: new Date(),
      status: 'pending'
    },
    {
      name: 'Michael Becker',
      email: 'michael.becker@example.com',
      age: 38,
      city: 'Düsseldorf',
      created_at: new Date(),
      status: 'active'
    },
    {
      name: 'Sarah Fischer',
      email: 'sarah.fischer@example.com',
      age: 27,
      city: 'Leipzig',
      created_at: new Date(),
      status: 'active'
    },
    {
      name: 'Daniel Hoffmann',
      email: 'daniel.hoffmann@example.com',
      age: 45,
      city: 'Dortmund',
      created_at: new Date(),
      status: 'inactive'
    },
    {
      name: 'Laura Schulz',
      email: 'laura.schulz@example.com',
      age: 22,
      city: 'Essen',
      created_at: new Date(),
      status: 'active'
    }
  ]);
  
  print('Datenbank, Collection und 10 Beispieleinträge erfolgreich erstellt!');
  print('Anzahl der Dokumente: ' + db.users.countDocuments());
"
