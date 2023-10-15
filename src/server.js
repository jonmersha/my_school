const express = require("express");
const app = express();
const port = 3000;

const path = require("path");
app.use("/res", express.static(path.join(__dirname, "../public")));

app.use(express.json());
// Define a route
app.get("/", (req, res) => {
  res.send("Is working well ann will addmore things ib the future!");
});
app.get("/home", (req, res) => {
  res.send("Home Routing added");
});

//User Managemnt
const userManagement = require("./routes/user_routes");
app.use("/user", userManagement);

//Resource Management
const resourceManagement = require("./routes/resource");
app.use("/res", resourceManagement);

// Start the server
//app.listen(3000);
app.listen();
