// RESTFul Services by NodeJS

const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');

// Connect to MySQL
const con = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'testmanga'
});

require('events').EventEmitter.defaultMaxListeners = 20; // Fix memory leaked

// Create RESTFUl
const app = express();
const publicDir = (__dirname+'/public'); // Set static dir for display image local by url
app.use(express.static(publicDir));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

// Get All BANNER
app.get("/banner", (req, res, next) => {
    con.query('SELECT * FROM banner', function(error,result,fields) {
        con.on('error', function(err) {
            console.log('[MY SQL ERROR]',err);
        });
        if (result && result.length) {
            res.end(JSON.stringify(result));
        } 
        else {
            res.end(JSON.stringify("No comic here"));
        }
    });
});

// Get All COMIC
app.get("/comic", (req, res, next) => {
    con.query('SELECT * FROM manga', function(error,result,fields) {
        con.on('error', function(err) {
            console.log('[MY SQL ERROR]',err);
        });
        if (result && result.length) {
            res.end(JSON.stringify(result));
        } 
        else {
            res.end(JSON.stringify("No comic here"));
        }
    });
});

// Get CHAPTER By MANGA ID
app.get("/chapter/:mangaid", (req, res, next) => {
    con.query('SELECT * FROM chapter where MangaID=?',[req.params.mangaid],function(error, result, fields) {
        con.on('error', function(err) {
            console.log('[MY SQL ERROR', err);
        });
        if (result && result.length) {
            res.end(JSON.stringify(result));
        }
        else {
            res.end(JOSN.stringify("No chapter here"));
        }
    });
});

// Get IMAGES By MANGA ID
app.get("/links/:chapterid", (req, res, next) => {
    con.query('SELECT * FROM link where ChapterId=?',[req.params.chapterid],function(error, result, fields) {
        con.on('error', function(err) {
            console.log('[MY SQL ERROR', err);
        });
        if (result && result.length) {
            res.end(JSON.stringify(result));
        }
        else {
            res.end(JOSN.stringify("No chapter here"));
        }
    });
});

// GET ALL CATEGORY
app.get("/categories", (req, res, next) => {
    con.query('SELECT * FROM Category',function(error, result, fields) {
        con.on('error', function(err) {
            console.log('[MY SQL ERROR', err);
        });
        if (result && result.length) {
            res.end(JSON.stringify(result));
        }
        else {
            res.end(JOSN.stringify("No categorory here"));
        }
    });
});

// GET Filter
app.post("/filter", (req, res, next) => {
    const post_data = req.body; // GET POST DATA from POST REQUEST
    var array = JSON.parse(post_data.data); // Parse 'data' field from POST REQUEST to JSON Array
    //const array = [11,30];
    var query = "SELECT * FROM manga WHERE ID IN (SELECT MangaID FROM mangacategory"; // default query
    if (array.length > 0) {
        query += " GROUP BY MangaID";
        if (array.length == 1) { // If user just submit 1 category
            query += " HAVING SUM(CASE WHEN CategoryID = "+array[0]+" THEN 1 ELSE 0 END) > 0)";
        } else { // If user submit more than 1 category
            for (var i = 0; i < array.length; i++) {
                if (i == 0) // first condition
                    query += " HAVING SUM(CASE WHEN CategoryID = "+array[0]+" THEN 1 ELSE 0 END) > 0 AND";
                else if (i == array.length-1) // Last condition
                    query += " SUM(CASE WHEN CategoryID = "+array[i]+" THEN 1 ELSE 0 END) > 0)";
                else
                    query += "SUM(CASE WHEN CategoryID ="+array[i]+" THEN 1 ELSE 0 END) > 0 AND";
            }
        }
        con.query(query,function(error, result, fields) {
            con.on('error', function(err) {
                console.log('[MY SQL ERROR', err);
            });
            if (result && result.length) {
                res.end(JSON.stringify(result));
            }
            else {
                res.end(JOSN.stringify("No comic here"));
            }
        });
    }
});

//SEARCH MANGA BY NAME
app.post("/search", (req, res, next) => {
    var post_data = req.body; // GET BODY POST
    var name_search = post_data.search; // GET 'search' data from POST REQUEST
    var query = "SELECT * FROM manga WHERE Name Like'%"+name_search+"%'";
    con.query(query, function(eror, result, fields) {
        con.on('error', function(err) {
            console.log('[MY SQL ERROR]',err);
        });
        if (result && result.length) {
            res.end(JSON.stringify(result));
        }
        else {
            res.end(JSON.stringify("No comic here"));
        }
    });
});

// Start server
app.listen(3000, () => {
    console.log('listening on port 3000');
})