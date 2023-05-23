//Hausaufgabe von Nick Helmke Woche 4
//INIT express
const express = require("express");
const app = express();
app.use(express.urlencoded({extended:true}));

//INIT EJS
app.engine(".ejs", require("ejs").__express);
app.set("view engine", "ejs");

//INIT SQLITE3
const DATABASE = "recipeFinder.db";
const db = require("better-sqlite3")(DATABASE); 

//Started den Webserver
app.listen(3000, function(){
    console.log("listening on 3000");
});
    
//Get-Requests

//Wir brauchen wahrscheinlich später noch n post dafür?
app.get("/login", function(req,res){
    res.render("login");
});


