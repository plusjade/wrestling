$(document).ready(function(){
  module("Constructor");
  test("build wrestler", function() {
    //given
    var is_home = true;
    //when
    var result = Match.build_wrestler(is_home);
    var other = Match.build_wrestler(!is_home);
    //then
    var exp = {id:'1', first_name: 'Home', last_name: 'Test', color: 'green', team: 'Home Team'};
    same(result, exp, "Created home team object");
    var exp_other = {id:'2', first_name: 'Visitor', last_name: 'Test', color: 'red', team: 'Visitor Team'};
    same(other, exp_other, "Created visiting object");
  });
  
  module("Score Manager");
  test("test add to blank", function() {
    //given
    var m = Match();
    //when
    m.add_score("red", "Takedown", 2);
    //then
    var res = m.get_scores();
    ok(res[0].label === "Takedown", "Test label set");
  });
  test("insert one", function() {
    //given
    var w = Match();
    w.add_score("red", "Takedown", 2);
    w.add_score("red", "Takedown", 2);
    //when
    w.add_score("green", "Escape", 1, 1);
    //then
    var res = w.get_scores();
    ok(res[0].label === "Takedown", "First element takedown");
    ok(res[1].label === "Escape", "Second element escape");
    ok(res[2].label === "Takedown", "Third element takedown");
  });
  test("insert one - index greater than length", function() {
    //given
    var res = "";
    var w = Match();
    w.add_score("red", "Takedown", 2);
    w.add_score("red", "Takedown", 2);
    //when
    try {
      w.add_score("red", "Escape", 1, 7);
    } catch(e) {
      res = e;
    }
    //then
    ok(res = "Index too large: 7", "Throws an exception.");
  });

  /*
  test("test constructor", function() {
  //given
  //when
  //then
  });
  */
});
