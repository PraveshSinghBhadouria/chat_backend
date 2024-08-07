const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const pool = require("../routes/pool");
require("dotenv").config();  

 
router.post("/register", (req, res) => {
  const { email, password } = req.body;
  const hashedPassword = bcrypt.hashSync(password, 10);
  pool.query(
    "INSERT INTO users (email, password) VALUES (?, ?)",
    [email, hashedPassword],
    (err, results) => {
      if (err) return res.status(500).send(err);
      res.status(201).send("User registered");
    }
  );
});

 
router.post("/login", (req, res) => {
  const { email, password } = req.body;
  pool.query("SELECT * FROM users WHERE email = ?", [email], (err, results) => {
    if (err) return res.status(500).send(err);
    if (results.length === 0) return res.status(404).send("User not found");

    const user = results[0];
    console.log(user);
    const isPasswordValid = bcrypt.compareSync(password, user.password);
    if (!isPasswordValid) return res.status(401).send("Invalid password");

    const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, {
  
      expiresIn: "1h",
    });
    res.status(200).json({ token: token, user: user });
  });
});

 
router.get("/", (req, res) => {
  pool.query("SELECT id, email FROM users", (err, results) => {
    if (err) return res.status(500).send(err);
    res.status(200).send(results);
  });
});

module.exports = router;
