var Validate = {};

Validate.require_fields = function (obj, fields) {
  var ret = "", i, ii;
  
  for (i = 0, ii = fields.length; i < ii; i++) {
    if (obj[fields[i]] === undefined) {
      ret += "Missing required field " + fields[i] + "; ";
    }
  }
  
  if (ret !== "") {
    throw ret;
  }
};

Validate.require_field = function (field, label) {
  if (field === undefined) {
    throw "Missing required field " + label + "; ";
  }
};

Validate.default_to_blank = function (obj, fields) {
  var i, ii;
  
  for (i = 0, ii = fields.length; i < ii; i++) {
    obj[fields[i]] = obj[fields[i]] || "";
  }
};
