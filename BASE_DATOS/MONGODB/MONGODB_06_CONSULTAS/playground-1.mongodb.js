use('retail');

db.employee.find(
     {employeeID: 1}, //Where
     {score: 1}       //Select
);
db.employee.updateOne(
    {employeeID: 1}, // Filtro = Where
    {$set: {score: [1, 2, 3]

    }
});
db.employee.find(
     {employeeID: 1}, //Where
     {score: 1, _id:0}       //Select
);

 //"firstName": "Janet",
db.employee.findOne({firstName: "Janet"}).score;
db.employee.find({firstName: "Janet"}).score; //Todos los documentos deben tener score
db.employee.find({firstName: "Janet"});

  {
	"employeeID": 10,
    "firstName": "Janet",
  }

db.employee.insertOne(
  {
	"employeeID": 11,
    "firstName": "Janet",
    "score": [4,5,6]
  }
);