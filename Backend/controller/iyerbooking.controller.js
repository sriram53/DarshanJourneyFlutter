const dbConfig = require('../database/config');

let iyerBooking = {};

iyerBooking.bookIyer = async (req) => {
    return new Promise((resolve, reject) => {
        try {
            var user_id = req.body.userId;
            var country = req.body.country;
            var state = req.body.state;
            var district = req.body.district;
            var city = req.body.city;
            var area = req.body.area;
            var address = req.body.address;
            var date = req.body.date;
            var time = req.body.time;
            var language = req.body.language;
            var function_type = req.body.function_type;
            var temple = req.body.temple;
            var function_name = req.body.function_name;
            var isAdmin_approved = req.body.isadmin_approved;
            var isIyer_approved = req.body.isIyer_approved;
            var rejectedReasonByAdmin = req.body.rejectedReasonByAdmin;
            var rejectedReasonByIyer = req.body.rejectedReasonByIyer;

            const sql = `INSERT INTO iyer_booking (user_id,country, state, district, city, area, address, date, time,
             language, function_type,function_name, temple,isAdmin_Approved,isIyer_Approved,
             rejectedReasonByAdmin,rejectedReasonByIyer) VALUES ('${user_id}','${country}', '${state}',
              '${district}', '${city}', '${area}', '${address}', '${date}', '${time}', '${language}', 
              '${function_type}', '${function_name}', '${temple}','${isAdmin_approved}',
              '${isIyer_approved}','${rejectedReasonByAdmin}','${rejectedReasonByIyer}')`;

            dbConfig.query(sql, (err, result) => {
                if (err) {
                    console.log("err!", err);
                    return reject({ status: 500, message: "error occured" });
                } else if (result.length != 0) {
                    return resolve({ status: 200, message: "iyer booked successfully" });
                }
            });

        } catch (e) {
            console.log(e);
            return reject({ status: 500, message: "Internal Server" });
        }
    });
};
iyerBooking.getallIyerBooking = async () => {
    return new Promise((resolve, reject) => {
        try {
            const sql = `SELECT iyer_booking.iyer_booking_id,
            user_id,
            priest_function.function_name,
            iyer_booking.isAdmin_Approved,
            iyer_booking.language as languageId,
            iyer_booking.user_id,
            iyer_booking.city as cityId,
            iyer_booking.function_name as functionId,
            iyer_booking.function_type as functiontypeId,
            userregister.UserName,
            iyer_booking.temple as templeId
            FROM iyer_booking
            LEFT JOIN userregister ON iyer_booking.user_id = userregister.id
            LEFT JOIN priest_function ON priest_function.id = iyer_booking.function_name;`;
            dbConfig.query(sql, (err, result) => {
                if (!err) {
                    return resolve(result);
                }
                else {
                    return reject(err);
                }
            });
        } catch (err) {
            return reject(err);
        }
    });
};
//get all with iyerApproved

iyerBooking.getallIyerBookingWithApprove = async () => {
    return new Promise((resolve, reject) => {
        try {
            const sql = `SELECT iyer_booking.isAdmin_Approved, iyer_booking.iyer_booking_id as iyerbookingId, iyer_booking.user_id, iyer_booking.country as countryID,iyer_booking.state as stateID,countries.country as Countryname,iyer_booking.state as stateID,states.state as Statename,iyer_booking.district as districtID,districts.district as Districtname,iyer_booking.city as cityID,city.city as Cityname,iyer_booking.area as areaID,
            area.area_name as Areaname,iyer_booking.address as Address,iyer_booking.time as iyerTime,iyer_booking.function_type,iyer_booking.language as languagenumer,iyer_booking.date as iyerdate,functioninsidethetemple.FunctionInsideTheTemple as functioninsidetemple,
   userregister.UserName,languages.language_name as languagename,userregister.Phone as PhoneNumber FROM iyer_booking 
   LEFT JOIN countries ON iyer_booking.country=countries.id 
   LEFT JOIN states ON iyer_booking.state=states.id 
   LEFT JOIN districts ON iyer_booking.district=districts.id 
   LEFT JOIN city ON iyer_booking.city=city.id  
   LEFT JOIN area ON iyer_booking.area=area.area_id 
   LEFT JOIN userregister ON iyer_booking.user_id = userregister.id LEFT JOIN languages ON iyer_booking.iyer_booking_id=languages.language_id WHERE iyer_booking.isAdmin_Approved=1 and iyer_booking.isIyer_Approved=1 ;
   `;
            dbConfig.query(sql, (err, result) => {
                if (!err) {
                    return resolve(result);
                }
                else {
                    return reject(err);
                }
            });
        } catch (err) {
            return reject(err);
        }
    });
};

//get single  with iyerApproved

iyerBooking.getsingleIyerBookingWithApprove = async (req) => {
    return new Promise((resolve, reject) => {
        try {
            var iyerBookingId = req.params.iyerBookingId;
            const sql = `SELECT iyer_booking.isAdmin_Approved, iyer_booking.iyer_booking_id as iyerbookingId, iyer_booking.user_id, iyer_booking.country as countryID,iyer_booking.state as stateID,countries.country as Countryname,iyer_booking.state as stateID,states.state as Statename,iyer_booking.district as districtID,districts.district as Districtname,iyer_booking.city as cityID,city.city as Cityname,iyer_booking.area as areaID,iyer_booking.function_type,
   area.area_name as Areaname,iyer_booking.address as Address,iyer_booking.time as iyerTime,iyer_booking.language as languagenumer,iyer_booking.date as iyerdate,
   userregister.UserName,userregister.Phone as PhoneNumber,languages.language_name as languagename FROM iyer_booking 
   LEFT JOIN countries ON iyer_booking.country=countries.id 
   LEFT JOIN states ON iyer_booking.state=states.id 
   LEFT JOIN districts ON iyer_booking.district=districts.id 
   LEFT JOIN city ON iyer_booking.city=city.id  
   LEFT JOIN area ON iyer_booking.area=area.area_id 
   LEFT JOIN userregister ON iyer_booking.user_id = userregister.id LEFT JOIN languages ON iyer_booking.iyer_booking_id=languages.language_id WHERE iyer_booking.isAdmin_Approved=1 and iyer_booking.isIyer_Approved=1 AND iyer_booking.iyer_booking_id = "${iyerBookingId}";
   `;
            dbConfig.query(sql, (err, result) => {
                if (!err) {
                    return resolve(result);
                }
                else {
                    return reject(err);
                }
            });
        } catch (err) {
            return reject(err);
        }
    });
};

//get All with iyerReject

iyerBooking.getallIyerBookingWithReject = async () => {
    return new Promise((resolve, reject) => {
        try {
            const sql = `SELECT iyer_booking.isAdmin_Approved, iyer_booking.iyer_booking_id as iyerbookingId, iyer_booking.user_id, iyer_booking.country as countryID,iyer_booking.state as stateID,countries.country as Countryname,iyer_booking.state as stateID,states.state as Statename,iyer_booking.district as districtID,districts.district as Districtname,iyer_booking.city as cityID,city.city as Cityname,iyer_booking.area as areaID,iyer_booking.function_type,
   area.area_name as Areaname,iyer_booking.address as Address,iyer_booking.time as iyerTime,iyer_booking.language as languagenumer,iyer_booking.date as iyerdate,functioninsidethetemple.FunctionInsideTheTemple as functioninsidetemple,
   userregister.UserName,languages.language_name as languagename,userregister.Phone as PhoneNumber FROM iyer_booking 
   LEFT JOIN countries ON iyer_booking.country=countries.id 
   LEFT JOIN states ON iyer_booking.state=states.id 
   LEFT JOIN districts ON iyer_booking.district=districts.id 
   LEFT JOIN city ON iyer_booking.city=city.id  
   LEFT JOIN area ON iyer_booking.area=area.area_id 
   LEFT JOIN userregister ON iyer_booking.user_id = userregister.id LEFT JOIN languages ON iyer_booking.iyer_booking_id=languages.language_id WHERE iyer_booking.isAdmin_Approved=1 and iyer_booking.isIyer_Approved=2;
   `;
            dbConfig.query(sql, (err, result) => {
                if (!err) {
                    return resolve(result);
                }
                else {
                    return reject(err);
                }
            });
        } catch (err) {
            return reject(err);
        }
    });
};
//get single with iyerReject

iyerBooking.getsingleIyerBookingWithReject = async (req) => {
    return new Promise((resolve, reject) => {
        try {
            var iyerBookingId = req.params.iyerBookingId;
            const sql = `SELECT iyer_booking.isAdmin_Approved, iyer_booking.iyer_booking_id as iyerbookingId, iyer_booking.user_id, iyer_booking.country as countryID,iyer_booking.state as stateID,countries.country as Countryname,iyer_booking.state as stateID,
            states.state as Statename,iyer_booking.district as districtID,districts.district as Districtname,iyer_booking.city as cityID,city.city as Cityname,iyer_booking.area as areaID,iyer_booking.function_type,
   area.area_name as Areaname,iyer_booking.address as Address,iyer_booking.time as iyerTime,iyer_booking.language as languagenumer,iyer_booking.date as iyerdate,
   userregister.UserName,languages.language_name as languagename,userregister.Phone as PhoneNumber FROM iyer_booking 
   LEFT JOIN countries ON iyer_booking.country=countries.id 
   LEFT JOIN states ON iyer_booking.state=states.id 
   LEFT JOIN districts ON iyer_booking.district=districts.id 
   LEFT JOIN city ON iyer_booking.city=city.id  
   LEFT JOIN area ON iyer_booking.area=area.area_id 
   LEFT JOIN userregister ON iyer_booking.user_id = userregister.id LEFT JOIN languages ON iyer_booking.iyer_booking_id=languages.language_id WHERE iyer_booking.isAdmin_Approved=1 and iyer_booking.isIyer_Approved=2 AND iyer_booking.iyer_booking_id = "${iyerBookingId}";
   `;
            dbConfig.query(sql, (err, result) => {
                if (!err) {
                    return resolve(result);
                }
                else {
                    return reject(err);
                }
            });
        } catch (err) {
            return reject(err);
        }
    });
};

iyerBooking.getSingleIyer = async (req) => {
    return new Promise((resolve, reject) => {
        try {
            var iyerBookingId = req.params.iyerBookingId;
            const sql = `SELECT iyer_booking.iyer_booking_id as iyerbookingId,
            iyer_booking.user_id,
            iyer_booking.country as countryID,
            iyer_booking.state as stateID,
            countries.country as Countryname,
            iyer_booking.state as stateID,
            states.state as Statename,
            iyer_booking.district as districtID,
            districts.district as Districtname,
            iyer_booking.city as cityID,
            city.city as Cityname,
            iyer_booking.area as areaID,
            area.area_name as Areaname,
            iyer_booking.address as Address,
            iyer_booking.time as iyerTime,
            iyer_booking.language as languagenumer,
            iyer_booking.date as iyerdate,
            userregister.UserName,
            languages.language_name as languagename
        FROM iyer_booking
            LEFT JOIN countries ON iyer_booking.country = countries.id
            LEFT JOIN states ON iyer_booking.state = states.id
            LEFT JOIN districts ON iyer_booking.district = districts.id
            LEFT JOIN city ON iyer_booking.city = city.id
            LEFT JOIN area ON iyer_booking.area = area.area_id
            LEFT JOIN userregister ON iyer_booking.user_id = userregister.id
            LEFT JOIN languages ON iyer_booking.language = languages.language_id
        WHERE iyer_booking.iyer_booking_id='${iyerBookingId}'`;
            dbConfig.query(sql, (err, result) => {
                if (!err) {
                    return resolve(result);
                }
                else {
                    return reject(err);
                }
            });
        } catch (err) {
            return reject(err);
        }
    });
};

iyerBooking.approvedByAdmin = async (req) => {
    return new Promise((resolve, reject) => {
        var iyerbookingId = req.params.iyerbookingId;
        var status = req.body.status;

        try {
            const sql = `UPDATE iyer_booking SET isAdmin_Approved = '${status}' where iyer_booking_id  = '${iyerbookingId}' `;


            dbConfig.query(sql, (err, result) => {
                if (err) {
                    return reject(err);
                }
                else {
                    return resolve(result);
                }
            });
        } catch (e) {
            return reject(e);
        }
    });
};
//approveby iyer

iyerBooking.approveByIyer = async (req) => {
    return new Promise((resolve, reject) => {
        var iyerbookingId = req.params.iyerbookingId;
        var status = req.body.status;
        var rejectedReasonByIyer = req.body.rejectedReasonByIyer;

        try {
            const sql = `UPDATE iyer_booking SET isIyer_Approved = '${status}',rejectedReasonByIyer= '${rejectedReasonByIyer}' where iyer_booking_id  = '${iyerbookingId}' `;

            dbConfig.query(sql, (err, result) => {
                if (err) {
                    return reject(err);
                }
                else {
                    return resolve(result);
                }
            });
        } catch (e) {
            return reject(e);
        }
    });
};


iyerBooking.updateIyerBooking = async (req) => {
    return new Promise((resolve, reject) => {
        try {
            var iyerbookingId = req.params.iyerbookingId;
            var status = req.body.status;
            var rejectedReasonByAdmin = req.body.rejectedReasonByAdmin;

            const sql = `UPDATE iyer_booking SET isAdmin_Approved = '${status}',rejectedReasonByAdmin = '${rejectedReasonByAdmin}' where iyer_booking_id = '${iyerbookingId}' `;
            dbConfig.query(sql, (err, result) => {
                if (err) {
                    return reject(err);
                }
                else {
                    return resolve(result);
                }
            });

        } catch (err) {
            return reject(err);
        }
    });
};

iyerBooking.getallIyerBookingWithAdminApprove = async () => {
    return new Promise((resolve, reject) => {
        try {
            const sql = `SELECT iyer_booking.iyer_booking_id as iyerbookingId, iyer_booking.user_id, iyer_booking.country as countryID,iyer_booking.state as stateID,countries.country as Countryname,iyer_booking.state as stateID,states.state as Statename,iyer_booking.district as districtID,districts.district as Districtname,iyer_booking.city as cityID,city.city as Cityname,iyer_booking.area as areaID,
   area.area_name as Areaname,iyer_booking.address as Address,iyer_booking.time as iyerTime,iyer_booking.function_type,iyer_booking.language as languagenumer,iyer_booking.date as iyerdate,
   userregister.UserName,languages.language_name as languagename, iyer_booking.isAdmin_Approved,iyer_booking.isIyer_Approved,iyer_booking.rejectedReasonByAdmin,iyer_booking.rejectedReasonByIyer FROM iyer_booking 
   LEFT JOIN countries ON iyer_booking.country=countries.id 
   LEFT JOIN states ON iyer_booking.state=states.id 
   LEFT JOIN districts ON iyer_booking.district=districts.id 
   LEFT JOIN city ON iyer_booking.city=city.id  
   LEFT JOIN area ON iyer_booking.area=area.area_id  
   LEFT JOIN userregister ON iyer_booking.user_id = userregister.id LEFT JOIN languages ON iyer_booking.iyer_booking_id=languages.language_id where iyer_booking.isAdmin_Approved=1 and iyer_booking.isIyer_Approved=0`;

            dbConfig.query(sql, (err, result) => {

                if (!err) {
                    return resolve(result);
                }
                else {
                    return reject(err);
                }
            });
        } catch (err) {
            return reject(err);
        }
    });
};

iyerBooking.getSingleIyerBookingWithAdminApprove = async (req) => {
    return new Promise((resolve, reject) => {
        try {
            var iyerBookingId = req.params.iyerBookingId;

            const sql = `SELECT iyer_booking.iyer_booking_id as iyerbookingId, iyer_booking.user_id, iyer_booking.country as countryID,iyer_booking.state as stateID,countries.country as Countryname,iyer_booking.state as stateID,states.state as Statename,iyer_booking.district as districtID,districts.district as Districtname,iyer_booking.city as cityID,city.city as Cityname,iyer_booking.area as areaID,iyer_booking.function_type,iyer_booking.function_name ,functions.FunctionName,
            area.area_name as Areaname,iyer_booking.address as Address,iyer_booking.time as iyerTime,iyer_booking.language as languagenumer,iyer_booking.date as iyerdate,
            userregister.UserName,languages.language_name as languagename,iyer_booking.isAdmin_Approved,iyer_booking.isIyer_Approved,iyer_booking.rejectedReasonByAdmin,iyer_booking.rejectedReasonByIyer FROM iyer_booking 
            LEFT JOIN functions on iyer_booking.function_name = functions.FunctionID
            LEFT JOIN countries ON iyer_booking.country=countries.id 
            LEFT JOIN states ON iyer_booking.state=states.id 
            LEFT JOIN districts ON iyer_booking.district=districts.id 
            LEFT JOIN city ON iyer_booking.city=city.id  
            LEFT JOIN area ON iyer_booking.area=area.area_id 
            LEFT JOIN userregister ON iyer_booking.user_id = userregister.id 
            LEFT JOIN languages ON iyer_booking.iyer_booking_id=languages.language_id 
            where iyer_booking.iyer_booking_id ="${iyerBookingId}" `;

            dbConfig.query(sql, (err, result) => {

                if (!err) {
                    return resolve(result);
                }
                else {
                    return reject(err);
                }
            });
        } catch (err) {
            return reject(err);
        }
    });
};


iyerBooking.ApprovedIyerCount = async (req) => {
    return new Promise((resolve, reject) => {
        var id = req.params.id;

        try {

            var sqlforapprove = `select * FROM iyer_booking where  iyer_id = '${id}' and isIyer_Approved=1;select * FROM iyer_booking where iyer_id = '${id}' and isIyer_Approved=2;select * FROM iyer_booking where  iyer_id = '${id}' and isIyer_Approved=0`;

            dbConfig.query(sqlforapprove, [1, 2, 3], (err, result) => {
                console.log(result, "data");
                var approved = result[0].length;
                var rejected = result[1].length;
                var pending = result[2].length;
                var status = {
                    'approved': approved,
                    'rejected': rejected,
                    'pending': pending,
                };
                if (err) {
                    return reject(err);
                }
                else {
                    // return resolve({status:200,message:"updated successfully"});
                    return resolve(status);
                }
            });


        } catch (err) {
            return reject(err);
        }
    });
};

iyerBooking.ApprovedIyerCount = async (req) => {
    return new Promise((resolve, reject) => {
        var id = req.params.id;

        try {
            var sqlforapprove = `select * FROM iyer_booking where  iyer_id = '${id}' and isIyer_Approved=1;select * FROM iyer_booking where iyer_id = '${id}' and isIyer_Approved=2;select * FROM iyer_booking where  iyer_id = '${id}' and isIyer_Approved=0`;

            dbConfig.query(sqlforapprove, [1, 2, 3], (err, result) => {
                console.log(result, "data");
                var approved = result[0].length;
                var rejected = result[1].length;
                var pending = result[2].length;
                var status = {
                    'approved': approved,
                    'rejected': rejected,
                    'pending': pending,
                };
                if (err) {
                    return reject(err);
                }
                else {
                    // return resolve({status:200,message:"updated successfully"});
                    return resolve(status);
                }
            });


        } catch (err) {
            return reject(err);
        }
    });
};

iyerBooking.getIyerbookingDataFromAdmin = async (req) => {
    return new Promise((resolve, reject) => {
        try {
            const status = req.params.status;
            const iyerstatus = req.params.iyerstatus;
            //old
            // let sql = `SELECT iyer_booking.*, userregister.UserName ,iyer_booking.function_type
            // FROM iyer_booking

            // LEFT JOIN userregister ON userregister.id = iyer_booking.user_id
            // LEFT JOIN functions ON functions.FunctionID = iyer_booking.function_name
            // `;

            //new 
            let sql = `SELECT iyer_booking.iyer_id,iyer_booking.iyer_booking_id,
            priest_function.function_name,
            function_type.function_type,
            userregister.UserName
            FROM iyer_booking
            LEFT JOIN priest_function ON iyer_booking.function_name = priest_function.id
            LEFT JOIN userregister ON userregister.id = iyer_booking.user_id
            LEFT JOIN function_type ON iyer_booking.function_type = function_type.id`;

            if (status || iyerstatus) {
                sql += ' WHERE';
            }
            if (status) {
                sql += ` iyer_booking.isAdmin_Approved = '${status}'`;
            }
            if (status && iyerstatus) {
                sql += ' and';
            }
            if (iyerstatus) {
                sql += ` iyer_booking.isIyer_Approved = '${iyerstatus}'`;
            }

            dbConfig.query(sql, (err, result) => {
                if (err) {
                    return reject(err);
                }
                else {
                    return resolve(result);
                }
            });

        } catch (err) {
            return reject(err);
        }
    });
};
iyerBooking.updateRejectedIyer = async (req, res) => {
    return new Promise((resolve, reject) => {
        try {
            var rejectedIyer = req.body.rejectedIyer;
            var iyerbookingId = req.params.iyerbookingId;
            const sql = `UPDATE iyer_booking SET RejectedIyer="${rejectedIyer}" WHERE iyer_booking_id="${iyerbookingId}"`;
            dbConfig.query(sql, (err, result) => {
                if (!err) {
                    return resolve(result);
                }
                else {
                    return reject(err);
                }
            });
        } catch (err) {
            return reject(err);
        }
    });
};
iyerBooking.updateAssignIyer = async (req, res) => {
    return new Promise((resolve, reject) => {
        try {
            var iyer_id = req.body.iyer_id;
            var iyerbookingId = req.params.iyerbookingId;


            var sql = `UPDATE iyer_booking SET iyer_id= "${iyer_id}", isAdmin_Approved = "1" WHERE iyer_booking_id="${iyerbookingId}"`;
            console.log(sql);
            dbConfig.query(sql, (err, result) => {
                if (!err) {
                    return resolve(result);
                }
                else {
                    return reject(err);
                }
            });
        } catch (err) {
            return reject(err);
        }
    });
};



iyerBooking.updateprice = async (req) => {
    return new Promise((resolve, reject) => {
        try {
            var iyer_booking_id = req.params.iyer_booking_id;
            var price = req.body.price;
            const sql = `UPDATE iyer_booking SET price = '${price}' where iyer_booking_id  = '${iyer_booking_id}' `;
            console.log(sql);
            dbConfig.query(sql, (err, result) => {
                if (err) {
                    return reject(err);
                }
                else {
                    return resolve(result);
                }
            });


        } catch (err) {
            return reject(err);
        }
    });
};


iyerBooking.getIyeridAcceptOrders = async (req) => {
    return new Promise((resolve, reject) => {
        try {
            var iyer_id = req.params.iyer_id;
            var isIyer_Approved = req.params.isIyer_Approved;

            var sql = `SELECT iyer_booking.*,userregister.* FROM  iyer_booking 
            LEFT JOIN userregister ON userregister.id = iyer_booking.user_id WHERE iyer_booking.iyer_id = '${iyer_id}' and iyer_booking.isAdmin_Approved = 1 and iyer_booking.isIyer_Approved = '${isIyer_Approved}'`;


            dbConfig.query(sql, (err, result) => {
                if (err) {
                    return reject(err);
                }
                else {
                    return resolve(result);
                }
            });

        } catch (err) {
            return reject(err);
        }
    });
};



module.exports = iyerBooking;