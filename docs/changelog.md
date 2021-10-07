## Changelog

- [Version 2.2](#version-22)
- [Version 2.1](#version-21)
- [Version 2](#version-2)
- [Version 2.beta3](#version-2.beta3)
- [Version 2.beta2](#version-2.beta2)
- [Version 2.beta1](#version-2.beta1)
- [Version 1](#version-1)

### Version 2.2
- Fix for PI not showing component names properly.
- Fix Random Missiles being possible to interrupt after been cast (some other spells too).
- Started Portuguese translation.

### Version 2.1
Updated IElib to be compatible with PI.

### Version 2
- Vortex:
  - made sure PnP free action doesn't override hold.
  - made sure it has sounds on BGEE.
- Corporeal instability: added missing poison immunity.
- Some translations updated.
- Changed Rhialto weapons to +1, to make sure he has them in BG1.
- Added squirrel script missing in BGEE.
- Ensured that special vortex never fails, so that Rhialto TURNS.
- Addded few more Larlochs to the fight so that Rhialto turns finally.
- Finally, should be fully EE-compatible.

### Version 2.beta3
- Better EE compatibility with `HANDLE_CHARSETS`.
- Updated some translations.

### Version 2.beta2
- Fixed problem with Rhialto never polymorphing.
- Added separate component to preserve the bear.
- Fixed TuTu installation.

### Version 2.beta1
- Allowed to be installed on EE (including IWD:EE).
- Made MacOS/Linux friendly.
- Combined some components to simplify installation.
- Preserve teddy bear upon BG1>BG2 transition.
- Fixed Rodent/Ratatosk shape: power, dispell/bypass, AC bonus, paw enchantment, description.
- Fixed Random spell X description.
- Fixed Rhialto's spell slots/levels.
- Fixed Blade shower
  - no permanent daggers
  - bypass magic protections such as GoI
  - clarify description
  - disable wild surges/spell failure for created daggers
- Under the hood:
  - dos2unix
  - lowercase
  - split components into multiple files
  - used newer weidu syntax, shortened where possible
  - streamlined scripts handling Rhialto appearance and items transfer

### Version 1.7
The original.
