# AmongMP

AmongMP is a modular social-deduction gamemode written in PAWN for open.mp.

## Target stack

- open.mp server
- PAWN
- BlueG SA-MP MySQL R41-4
- MySQL/MariaDB
- Modular include-based architecture

## Planned modules

- Core and game state
- BlueG MySQL database layer
- Accounts and authentication
- Persistent characters and customization
- Persistent player statistics
- Lobby and rounds
- Roles
- Tasks
- Meetings and voting
- Sabotage
- Win conditions
- HUD/UI
- Administration and debugging

## Development status

Initial repository bootstrap.

## Repository layout

```text
gamemodes/
src/
  core/
  database/
  player/
  game/
  world/
  ui/
  admin/
database/
scriptfiles/
```

## Database

The project targets BlueG MySQL R41-4. Database credentials will not be committed; an example configuration will be provided instead.

## License / third-party components

Third-party plugins/includes remain subject to their respective licenses. They will be documented as dependencies rather than copied into this repository unless redistribution is explicitly permitted.
