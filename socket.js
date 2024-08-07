const socketIO = require("socket.io");
const pool = require("./routes/pool");
const jwt = require('jsonwebtoken');  
require('dotenv').config();  

let io;

function setupSocket(server) {
  io = socketIO(server, {
    cors: {
      origin: "http://localhost:3000",
      methods: ["GET", "POST", "PUT", "DELETE"],
      allowedHeaders: ["Content-Type", "Authorization"],
      credentials: true,
    },
  });

  io.on("connection", (socket) => {
    console.log("A user connected");
 
    socket.on('authenticate', (token) => {
      jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
        if (err) {
          socket.emit('unauthorized', 'Invalid token');
          return;
        }
        socket.userId = decoded.id; 
        socket.emit('authenticated');
      });
    });

    
    socket.on("sendMessage", (data) => {
      const { receiverId, message } = data;
      if (!socket.userId) {
        socket.emit('unauthorized', 'User not authenticated');
        return;
      }
      pool.query(
        "INSERT INTO messages (sender_id, receiver_id, message) VALUES (?, ?, ?)",
        [socket.userId, receiverId, message],
        (err, results) => {
          if (err) {
            console.error(err);
            return;
          }
          io.emit("newMessage", data);
        }
      );
    });

    socket.on("disconnect", () => {
      console.log("User disconnected");
    });
  });
}

function getIo() {
  if (!io) {
    throw new Error("Socket.io not initialized!");
  }
  return io;
}

module.exports = { setupSocket, getIo };
