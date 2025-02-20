heal_command:
  type: command
  name: heal
  debug: false
  description: Heals yourself or another player
  usage: /heal (player)
  permission: behr.essentials.heal
  tab completions:
    1: <server.online_players.exclude[<player>].parse[name]>
  script:
    - if <context.args.is_empty>:
      - define player <player>

    - else if <context.args.size> == 1:
      - define player_name <context.args.first>
      - inject player_verification

    - else:
      - inject command_syntax_error

    - heal <[player]>
    - adjust <[player]> food_level:20
    - if <[player]> != <player>:
        - narrate "<&[yellow]><[player_name]> <&[green]>was healed"
    - narrate targets:<[player]> "<&[green]>You were healed"
