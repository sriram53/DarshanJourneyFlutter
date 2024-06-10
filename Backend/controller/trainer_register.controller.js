const dbConfig = require("../database/config");
const bcrypt = require("bcryptjs");
require("dotenv").config();
const jwt = require("jsonwebtoken");

let trainer = {};

trainer.createRegister = async (req, res) => {
  return new Promise((resolve, reject) => {
    try {
      const name = req.body.name;
      console.log("req.body :>> ", req.body);
      // const businessName = req.body.businessName;
      const country = req.body.country;
      const state = req.body.state;
      const district = req.body.district;
      const city = req.body.city;
      const area = req.body.area;
      const address = req.body.address;
      const pincode = req.body.pincode;
      const phone = req.body.phone_number;
      // const whatsapp = req.body.whatsapp_number;
      const hash = bcrypt.hashSync(req.body.password, 10);
      const password = hash;

      console.log(
        "hgbuyhgsd",
        name,
        country,
        state,
        district,
        city,
        area,
        address,
        pincode,
        phone,
        password
      );
      const sqlQuery = `INSERT INTO trainer_register(trainerName,countryId,stateId,districtId,cityId,areaId,address,pincode,phone,password)
            VALUES("${name}","${country}","${state}","${district}","${city}","${area}","${address}","${pincode}","${phone}","${password}")`;

      // const sql2 = `SELECT * FROM trainer_register WHERE phone="${phone}"`;
      dbConfig.query(sqlQuery, (err, result) => {
        console.log("result :>> ", result);
        if (err) {
          console.log("err :>> ", err);
          return reject(err);
        }

        if (result) {
          if (err) {
            return reject(err);
          } else {
            let token = jwt.sign({ phone: phone }, process.env.SECRET_KEY);
            return resolve({
              status: "Success",
              message:
                "Registration is successful please wait for admin confirmation",
              ID: result.insertId,
              token: token,
            });
          }
        } else {
          return reject({ status: 409, message: "Trainer already exists" });
        }
      });
    } catch (e) {
      return reject(e);
    }
  });
};

trainer.login = async (req, res) => {
  return new Promise((resolve, reject) => {
    try {
      const phone = req.body.phone;
      var password = req.body.password;
      console.log(phone, password);
      const sql = `SELECT * FROM trainer_register WHERE phone = "${phone}"`;
      dbConfig.query(sql, (err, user) => {
        console.log(user, "trainer");
        if (err) {
          return reject({ status: 500, message: err });
        } else {
          if (user.length == 0) {
            return resolve({
              status: "Failed",
              message: "Phone number doesn't exist",
            });
          } else {
            const hashedPassword = user[0].password;
            if (bcrypt.compareSync(password, hashedPassword)) {
              const token = jwt.sign(
                { phone: user[0].phone },
                process.env.SECRET_KEY
              );
              return resolve({
                id: user[0].trainer_id,
                token: token,
                role: "trainer",
                status: "Success",
                message: "Login Successfully",
              });
            } else {
              return reject({
                status: "Failed",
                message: "Password Incorrect",
              });
            }
          }
        }
      });
    } catch (e) {
      return reject(e);
    }
  });
};

trainer.getSingleTrainer = async (req) => {
  return new Promise((resolve, reject) => {
    try {
      var id = req.params.id;
      const sql = `SELECT trainer_register.trainer_id as trainer_id,trainer_register.trainerName as trainerName,trainer_register.businessName as businessName,trainer_register.countryCode as countryCode ,trainer_register.countryId as countryId,countries.country as
            countryName,trainer_register.stateId as stateId,states.state as stateName,trainer_register.districtId as districtId,districts.district as districtName,trainer_register.cityId as cityId,city.city as cityName,trainer_register.areaId as areaId,area.area_name as areaName,trainer_register.address as address,
            trainer_register.pincode as pincode,trainer_register.phone as phone ,trainer_register.whatsapp as whatsapp FROM  trainer_register LEFT JOIN countries ON trainer_register.countryId=countries.id LEFT JOIN states ON trainer_register.stateId=states.id LEFT JOIN districts ON trainer_register.districtId=districts.id LEFT JOIN city ON trainer_register.cityId=city.id
            LEFT JOIN area ON trainer_register.areaId=area.area_id  WHERE trainer_register.trainer_id  = "${id}"`;
      dbConfig.query(sql, (err, result) => {
        if (!err) {
          return resolve(result);
        } else {
          return reject(err);
        }
      });
    } catch (err) {
      return reject(err);
    }
  });
};
trainer.updateTrainer = async (req) => {
  return new Promise((resolve, reject) => {
    try {
      var id = req.params.id;
      console.log('first', id)
      const businessName = req.body.businessName;
      const country = req.body.country;
      const state = req.body.state;
      const district = req.body.district;
      const city = req.body.city;
      const area = req.body.area;
      const address = req.body.address;
      const phone = req.body.phone;
      const whatsapp = req.body.whatsapp;
      const pincode = req.body.pincode;
      var trainerName = req.body.trainerName;
      const sql = `UPDATE trainer_register SET trainerName = "${trainerName}",businessName= "${businessName}",
        phone="${phone}",whatsapp="${whatsapp}",countryId="${country}",stateId="${state}",districtId="${district}",cityId="${city}",areaId="${area}",address="${address}",pincode="${pincode}" WHERE trainer_id  = "${id}"`;
      dbConfig.query(sql, (err, result) => {
        if (!err) {
          return resolve(result);
        } else {
          return reject(err);
        }
      });
    } catch (err) {
      return reject(err);
    }
  });
};
trainer.getallTrainer = async (req) => {
  return new Promise((resolve, reject) => {
    try {
      const sql = `SELECT trainer_id,trainerName FROM trainer_register`;
      dbConfig.query(sql, (err, result) => {
        if (!err) {
          return resolve(result);
        } else {
          return reject(err);
        }
      });
    } catch (err) {
      return reject(err);
    }
  });
};
trainer.deleteTrainer = async (req) => {
  return new Promise((resolve, reject) => {
    try {
      var id = req.params.id;
      const sql = `DELETE FROM trainer_register WHERE trainer_id = "${id}"`;
      dbConfig.query(sql, (err, result) => {
        if (!err) {
          return resolve(result);
        } else {
          return reject(reject);
        }
      });
    } catch (err) {
      return reject(err);
    }
  });
};
module.exports = trainer;
