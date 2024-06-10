const express = require("express");
const Admin = express.Router();
const dbConfig = require("../database/config");
const cors = require("cors");
const jwt = require("jsonwebtoken");
require("dotenv").config();

const bcrypt = require("bcryptjs");

const admin = require("../model/vendors.model");

Admin.use(cors());

Admin.post("/register", (req, res) => {
  console.log("vendor", req.body);
  const VendorData = {
    vendor_name: req.body.vendor_name,
    business_name: req.body.business_name,
    // country_code_id: req.body.country_code_id,
    country_id: req.body.country_id,
    state_id: req.body.state_id,
    district_id: req.body.district_id,
    city_id: req.body.city_id,
    area_id: req.body.area_id,
    address: req.body.address,
    pincode: req.body.pincode,
    phone_number: req.body.phone_number,
    password: req.body.password,
    is_active: req.body.is_active || false,
    post: req.body.post || "0",
    isApproved: req.body.isApproved || 0,
    rejectReasonByAdmin: req.body.rejectReasonByAdmin || "",
  };

  admin
    .findOne({
      where: {
        phone_number: VendorData.phone_number,
      },
    })
    .then(Admin => {
      if (!Admin) {
        console.log(Admin, "adminline-41");
        console.log(VendorData, "usersData1");
        const hash = bcrypt.hashSync(VendorData.password, 10);

        VendorData.password = hash;

        admin
          .create(VendorData)
          .then(Admin => {
            console.log(Admin, "usersData2");
            let token = jwt.sign(Admin.dataValues, process.env.SECRET_KEY, {
              expiresIn: 1440,
            });

            res.status(200).json({
              vendors: Admin,
              token: token,
              status: "Success",
              message: "Registration is successful please wait for admin confirmation",
            });
          })
          .catch(err => {
            console.log("Error on vendor");
            res.status(401).json({
              status: "Failed",
              message: "Error on vendor signup",
            });
          });
      } else {
        console.log("users already exists");
        res
          .status(500)
          .json({ status: "Failed", message: "users already exists" });
      }
    })
    .catch(err => {
      res
        .status(400)
        .json({ status: "Failed", message: "Error occured try again later" });
    });
});

Admin.post("/login", (req, res) => {
  console.log(req.body.phone_number);
  console.log(req.body.password);

  admin
    .findOne({
      where: {
        phone_number: req.body.phone_number,
        isApproved: 1,
      },
    })
    .then(user => {
      if (user) {
        console.log(req.body.password, user.password);
        console.log("user", user);
        if (bcrypt.compare(req.body.password, user["dataValues"].password)) {
          let token = jwt.sign(user.dataValues, process.env.SECRET_KEY, {
            expiresIn: 1440,
          });
          res.json({
            id: user["dataValues"].vendor_id,
            name: user["dataValues"].vendor_name,
            token: token,
            role: "vendor",
          });
          console.log(token);
        } else {
          console.log("Wrong password");
          return res.json({ error: "Wrong password" });
        }
      } else {
        console.log("User does not exist");
        return res.status(500).json({
          status: "User does not exist",
          message: "something went wrong please contact Admin ",
        });
      }
    })
    .catch(err => {
      res.status(400).json({ error: err });
    });
});

const vendors_controller = require("../controller/vendors.controller");
Admin.get("/getAll", vendors_controller.vendors_GetAll);
Admin.put("/update/:id", vendors_controller.vendor_update);
Admin.get("/getOne/:id", vendors_controller.vendorGetOne);
Admin.delete("/delete/:vendor_id", vendors_controller.vendorDelete);
Admin.put("/changeStatus", vendors_controller.changeStatus);
Admin.put("/changePostStatus", vendors_controller.changePostStatus);
Admin.get("/vendorApprove", vendors_controller.vendorApproveId);

// router.get("getOneNumber/:phone_number", vendors_controller.vendorByNumber);

//Router export
module.exports = Admin;
