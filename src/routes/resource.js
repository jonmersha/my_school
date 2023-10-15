const express = require("express");
const router = express.Router();
//Crud Opearions
const insertOP = require("../utils/insert");
const selectOP = require("../utils/select");
const callFunc = require("../utils/call_backs");
const updateOP = require("../utils/update");
const deleteOP = require("../utils/delete");

//==================================================REsource Managements
//Getting All RESOURCE
router.get("/get", (req, res) => {
  const stm = selectOP.selectAll("RESOURCE");
  callFunc.addDataCallBack(stm, res);
});

//Adding RESOURCE
router.post("/add", (req, res) => {
  let stm = insertOP.insert("RESOURCE", req.body);
  callFunc.addDataCallBack(stm, res);
});
//Updating RESOURCE
router.put("/update", (req, res) => {
  let stm = updateOP.update("RESOURCE", req.body);
  callFunc.addDataCallBack(stm, res);
});

//deleting RESOURCE
router.delete("/delete", (req, res) => {
  let stm = deleteOP.deleteScript("RESOURCE", req.body);
  console.log(stm);
  callFunc.addDataCallBack(stm, res);
});

module.exports = router;
