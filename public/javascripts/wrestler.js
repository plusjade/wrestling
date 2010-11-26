function Wrestler(opt) {
  Validate.require_field(opt.id, "id");
  Validate.require_field(opt.name, "name");
  Validate.require_field(opt.color, "color");
  
  opt.team = opt.team || "";
  
  //valid states: neutral, top, bottom
  var state = "neutral";
  
  return {
    set_name: function (value) {
      opt.name = value;
    },
    get_name: function () {
      return opt.name;
    },
    get_id: function () {
      return opt.id;
    },
    set_color: function (value) {
      opt.color = value;
    },
    get_color: function () {
      return opt.color;
    },
    set_state: function (value) {
      state = value;
    },
    get_state: function () {
      return state;
    }
  };
}
Wrestler.build_wrestler = function (is_visitor) {
  if(is_visitor)
};

function ScoreBoard() {
  
  function insert_score(s, index) {
    //if index is not supplied, push
    index = index || s.length;
    
    if (index > s.length) {
      throw "Index too large: " + index;
    }
    
    if (index > -1) {
      scores.splice(index, 0, s);
    } else {
      scores.push(s);
    }
  }
  
  function build_score(label, value) {
    var s = {'label': label, 'value': value};
    
    return s;
  }
  
  return {
    add_score: function (id, label, value, index) {
      var s = build_score(label, value);
      insert_score(s, index);
    },
    remove_score: function (index) {},
    move_score: function (from, to) {}
  };
}