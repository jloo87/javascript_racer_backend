$(document).ready(function(){
    var p1_position = 0;
    var p2_position = 0;

    var update_player_position = function(player){

      var update_location = function(current){
        var future = current.next('td');
        if (future.size() == 0 )
        {
          if (p1_position > p2_position)
          {
            $('body').append("<h3>Winner is " + p1_name + "</h3>");
          }
          else
          {
            $('body').append("<h3>Winner is " + p2_name + "</h3>");
          }
        $("#restart").css('visibility', 'visible');
        }
        else
        {
          current.removeClass();
          future.addClass('active');
        }
      };

      if (player == 1)
        {
        var starting_cell = $('tr[id = "player1_strip"] .active');
        }
      else if (player == 2)
        {
        var starting_cell = $('tr[id = "player2_strip"] .active');
        }

      update_location(starting_cell);
    };

    $(document).keyup(function(e) {
      if ($('h3').size() == 0)
      {
        if (e.which == 80)
          {
            p1_position += 1;
            update_player_position(1);
          }
        else if (e.which == 81)
        {
          p2_position += 1;
          update_player_position(2);
        }
      };
    });

    $("#restart").click(function() {
      console.log("clicked");
    $("#restart").css('visibility', 'hidden');
    $("h3").remove();
    $("#player1_strip td").removeClass();
    $("#player2_strip td").removeClass();
    $("#player1_strip :first-child").addClass('active');
    $("#player2_strip :first-child").addClass('active');
    });
});

