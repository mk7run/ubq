/****************************************************************/
/*   It is required to use a for loop                           */
/*   when iterating over a stamp's array of appraisal values.   */
/****************************************************************/

var Stamp = function(args){
  this.name = args.name;
  this.issueDate = args.issueDate;
  this.appraisalValues = args.appraisalValues
}

Stamp.prototype.totalAppraisal = function(){
  var stampValues = this.appraisalValues;
  for (var i = 0; i < stampValues.length; i++){
    return stampValues.reduce(function(sum, value){
      return sum + value
    });
    return (total/ this.appraisalValues.length)
  };
};

Stamp.prototype.averageAppraisal = function(){
  return (this.totalAppraisal() / this.appraisalValues.length)
}

Stamp.prototype.maximumAppraisal = function(){
  var sortedAppraisal = this.appraisalValues.sort()
  return sortedAppraisal.pop()
}