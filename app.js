require('dotenv').config(); 

const createError = require("http-errors");
const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
const cors = require("cors");
const bodyParser = require("body-parser");
const http = require("http");

const { setupSocket } = require("./socket");
const usersRouter = require("./routes/users");
const chatRouter = require("./routes/chat");

const app = express();
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: true }));

 
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

 
app.use(
  cors({
    origin: "http://localhost:3000",
    methods: ["GET", "POST", "PUT", "DELETE"],
    allowedHeaders: ["Content-Type", "Authorization"],
    credentials: true,
  })
);

 
app.use("/users", usersRouter);
app.use("/chat", chatRouter);

 
app.use(function (req, res, next) {
  next(createError(404));
});

app.use(function (err, req, res, next) {
  console.error(err.stack);
  res.status(500).json({
    status: false,
    message: "Internal server error",
    error: err.message,
  });
});
 

const server = http.createServer(app);
setupSocket(server);  
server.listen(5000, () => {
  console.log("Server listening on port", 5000);
});

module.exports = app;
