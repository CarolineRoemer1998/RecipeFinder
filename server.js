// ----------------------------------------------------------
// Initialisierungen
// ----------------------------------------------------------
const express = require("express");
const app = express();
app.use(express.urlencoded({extended:true}));

app.engine(".ejs", require("ejs").__express);
app.set("view engine", "ejs");

//Lässt es zu das Dateien aus dem public ordner geladen werden können
app.use(express.static(__dirname + '/public'));

const DATABASE = "recipeFinder.db";
const db = require("better-sqlite3")(DATABASE); 

app.listen(3000, function(){
    console.log("listening on 3000");
});

//Wenn du den Server nicht starten kannst musst du password-hash runterladen, 
//mit dem Befehl: npm install password-hash --save
const passwordHash = require('password-hash');

const session = require('express-session');
app.use(session({
 secret: 'geheim123',
 resave: false,
 saveUninitialized: true
}));


// ----------------------------------------------------------
// Get-Requests
// ----------------------------------------------------------

app.get("/login", function(req,res){
    res.render("login", {'status': 0});
});

app.get("/logout", function(req,res){    
    console.log(req.session.sessionValue);
    delete req.session['sessionValue'];
    console.log(req.session.sessionValue);
    res.render("login", {'status': 0});
});

app.get("/signup", function(req,res){
    res.render("signup", {'status': 0});
});

// erstmal als get zum testen
app.get("/home", function(req,res){
    res.render("home");
});

app.get("/pantry", function(req,res){
    res.render("pantry");
});

// ----------------------------------------------------------
// Post-Requests
// ----------------------------------------------------------

app.post("/onsignup", function(req,res){
    const _name = req.body.name;
    const _email = req.body.email;
    const _password1 = req.body.password1;
    const _password2 = req.body.password2;

    if(_password1==_password2){
        let selectInfo = db.prepare(`SELECT * FROM benutzer WHERE name='${_name}';`).all();

        if(selectInfo.length == 0){
            const password = _password1;
            const hash = passwordHash.generate(password);
            db.exec(`INSERT INTO benutzer (name,passwort,email) VALUES ('${_name}', '${hash}', '${_email}');`)
            res.redirect('/home');
            req.session['sessionValue'] = db.prepare(`SELECT id FROM benutzer WHERE name='${_name}';`).all()[0].id;
        }
        else{
            res.render('signup', {'status': 2});
        }
    }
    else{
        res.render('signup', {'status':1})
    }
})

app.post("/onlogin", function(req,res){
    const _name = req.body.name;
    const _password = req.body.password;

    let selectInfo = db.prepare(`SELECT * FROM benutzer WHERE name='${_name}';`).all();

    if(selectInfo.length==1)
    {
        let selectPassword = db.prepare(`SELECT passwort FROM benutzer WHERE name='${_name}';`).all();
        let passwordSame = passwordHash.verify(_password,selectPassword[0].passwort);
        if(passwordSame)
        {
            res.redirect('/home');
            req.session['sessionValue'] = db.prepare(`SELECT id FROM benutzer WHERE name='${_name}';`).all()[0].id;
        }
        else
        {
            // 1 = Passwort falsch | 2 = Benutzer existiert nicht
            
            let _status = 1
            res.render('login', {'status': _status})
            console.log("Status: " + _status)
        }
    }
    else
    {
        let _status = 2
        res.render('login', {'status': _status})
        console.log("Status: " + _status)
    }
})
