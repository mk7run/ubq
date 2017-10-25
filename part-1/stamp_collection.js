/******************************************************************/
/*   It is required to use Array.prototype methods                */
/*   when iterating over a stamp collections's array of stamps.   */
/******************************************************************/

var StampCollection = function(stamps){
  this.stamps = stamps
};

StampCollection.prototype.stampNamed = function(stampName){
  return this.stamps.find(function(stamp){
    return stamp.name === stampName;
  });
};

StampCollection.prototype.stampsIssued = function(stampYear){
  return this.stamps.filter(function(stamp){
    return stamp.issueDate === stampYear;
  })
};

StampCollection.prototype.value = function(){
  var maxStampValues = 0
  this.stamps.forEach(function(stamp){
    maxStampValues += stamp.maximumAppraisal()
  });
  return maxStampValues
};
