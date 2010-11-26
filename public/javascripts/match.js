function Match() {
  var scores_array = [],
    home = Match.build_wrestler(true),
    visitor = Match.build_wrestler(false);

  
  function insert_score(s, insert_at) {
    //if index is not supplied, push
    insert_at = insert_at || s.length;
    
    if (insert_at > s.length) {
      throw "Index too large: " + insert_at;
    }
    
    if (insert_at > -1) {
      scores_array.splice(insert_at, 0, s);
    } else {
      scores_array.push(s);
    }
  }
  
  function build_score(color, label, value) {
    var s = {'color': color, 'label': label, 'value': value};
    
    return s;
  }
  
  function get_id_from_color(color) {
    if(home.color === color) {
      return home.id;
    }
    if(visitor.color === color) {
      return visitor.id;
    }
  }
  
  return {
    score: function (attacking, defending, score) {
      
    },
    add_score: function (color, label, value, insert_at) {
      var score = build_score(color, label, value);
      insert_score(score, insert_at);
    },
    get_scores: function() {
      return scores_array;
    }
  };
}

Match.build_wrestler = function (is_home) {
  var postfix = "visitor",
    w = {};
  if (is_home === true) {
    postfix = "home";
  }
  
  w.id = document.getElementById("id_" + postfix).value;
  w.first_name = document.getElementById("first_" + postfix).value;
  w.last_name = document.getElementById("last_" + postfix).value;
  w.color = document.getElementById("color_" + postfix).value;
  w.team = document.getElementById("team_" + postfix).value;
  
  return w;
}