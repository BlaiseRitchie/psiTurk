#  Filename: HITView.coffee
define [
        "backbone"
        "views/TableView"
      ],
      (
        Backbone
      ) ->

        class HITView extends Backbone.TableView

          title: " "

          columns:
            title:
              header: "Title"
            hitid:
              header: "Id"
            max_assignments:
              header: "Progress"
              draw: (model) ->
                completed = model.get("number_assignments_completed")/model.get("number_assignments_available")
                return("<div class='progress progress-mini progress-striped'> <div class='bar' style='width: #{completed}%'></div> </div>")
            expiration:
              header: "Expires"
              draw: (model) ->
                new Date(model.get "expiration")
            expire:
              header: " "
              draw: (model) ->
                id = model.get "hitid"
                button = "<button id=#{id} class='btn btn-small expire'>Expire</button>"
                return(button)
            extend:
              header: " "
              draw: (model) ->
                id = model.get "hitid"
                button = "<button id=#{id} class='btn btn-small extend'>Extend</button>"
                return(button)

          pagination: false
          size: 5
