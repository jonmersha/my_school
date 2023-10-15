const express = require("express");
const app = express();
const port = 3000;

app.use(express.json());
// Define a route
app.get("/", (req, res) => {
  res.send("Is working well ann will addmore things ib the future!");
});

//Some of the thisngs added
// const planRoutes = require("./routes/plan");
// app.use("/plan", planRoutes);

// const settingRoutes = require("./routes/system_setting");
// app.use("/setting", settingRoutes);

// //Audit Object
// const auditObject = require("./routes/audit_object");
// app.use("/audit", auditObject);

// //Audit Object
// const riskManagement = require("./routes/risk_management");
// app.use("/risk", riskManagement);

// //Audit Object
// const orgStructure = require("./routes/org_structure");
// app.use("/org", orgStructure);

//User Managemnt
// const userManagement = require("./routes/user_routes");
// app.use("/user", userManagement);

// //Reporting
// const reporting = require("./routes/reporting");
// app.use("/report", reporting);

// //Audit Project
// const project = require("./routes/project");
// app.use("/project", project);

//Reporting
// const reporting = require("./routes/reporting");
// app.use("/report", reporting);

// //Audit Project
// const project = require("./routes/project");
// app.use("/project", project);

// Start the server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
