var mysql = require("mysql")
var pool = mysql.createPool(
    {
        host:'localhost',
        port:'3306',
        user:'root',
        password:'3352',
        database:'chat_app',
        multipleStatements:true,
        connectionLimit:100
    }
)

module.exports =pool