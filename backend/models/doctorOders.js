const mongoose = require('mongoose');

const doctorOderSchema = mongoose.Schema({
  doctorName: {type: String , require:true},
  doctorContact: {type: String , require:true},
  doctorID: {type: String , require:true},
  doctorEmail: {type: String , require:true},
  userID: {type: String , require:true},
  userName: {type: String , require:true},
  drugId : { type: Array , require: true},
  drugNames : { type: Array , require: true},
  drugPrice: {type: Array , require:true},
  drugQuantity: {type: Array , require:true},
  realQuantity: {type: Array , require:true},
  totalAmount : { type: String , require: true},
  pickupDate : { type: String , require: true},
  isVerified: {type: Boolean, require: true, default: false},
  isPickedUp: {type: Boolean, require: true, default: false},
})

module.exports = mongoose.model('DoctorOder',doctorOderSchema);
