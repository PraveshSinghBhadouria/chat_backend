const express = require('express');
const router = express.Router();
const pool = require('../routes/pool');
const jwt = require('jsonwebtoken');

const verifyToken = (req, res, next) => {
  const token = req.headers['x-access-token'];
  if (!token) return res.status(403).send('No token provided');
  
  jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
    if (err) return res.status(500).send('Failed to authenticate token');
    req.userId = decoded.id;
    next();
  });
};

router.get('/history/:userId', verifyToken, async (req, res) => {
  const { userId } = req.params;
  try {
    const [rows] = await pool.query('SELECT * FROM messages WHERE (sender_id = ? OR receiver_id = ?) ORDER BY timestamp', [req.userId, userId]);
    res.status(200).json(rows);
  } catch (err) {
    res.status(500).send(err);
  }
});

router.post('/send', verifyToken, async (req, res) => {
  const { receiverId, message } = req.body;
  try {
    await pool.query('INSERT INTO messages (sender_id, receiver_id, message) VALUES (?, ?, ?)', [req.userId, receiverId, message]);
    res.status(201).send('Message sent');
  } catch (err) {
    res.status(500).send(err);
  }
});

module.exports = router;
