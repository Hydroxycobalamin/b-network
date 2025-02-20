rename_item_command:
  type: command
  name: rename_item
  debug: false
  description:  Applies a custom display name to the item in hand
  usage: /rename_item <&lt>Display name<&gt>
  permission: behr.essentials.rename_item
  script:
  # % ██ [ check if not typing anything ] ██
    - if <context.args.is_empty>:
      - inject command_syntax_error

  # % ██ [ check if holding an item     ] ██
    - if <player.item_in_hand.material.name> == air:
      - define error "Hold an item to add lore to"
      - inject command_error

  # % ██ [ format lore to add           ] ██
    - define display_name <context.raw_args.parse_color>

  # % ██ [ set items display name       ] ██
    - inventory adjust slot:<player.held_item_slot> display_name:<[display_name]>
    - playsound <player> entity_ender_eye_death
