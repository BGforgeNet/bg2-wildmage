# Wild Mage additions mod for Baldur's Gate 2

[![Translation status](https://tra.bgforge.net/widgets/infinity-engine/-/wild-mage-additions/svg-badge.svg)](https://tra.bgforge.net/projects/infinity-engine/wild-mage-additions/)
[![Build Status](https://golem.bgforge.net/mods/wild-mage-additions/status.svg)](https://golem.bgforge.net/mods/wild-mage-additions)
[![Discord chat](https://img.shields.io/discord/420268540700917760?logo=discord)](https://discord.gg/4Yqfggm)

[__Download__](https://github.com/BGforgeNet/bg2-wildmage/releases/latest)
| [__Discuss__](https://forums.bgforge.net/viewtopic.php?f=4&t=17)
| [__Translate__](https://tra.bgforge.net/projects/infinity-engine/wild-mage-additions/)
| [__Report issues__](#report-issues)

This mod expands on Wild Magic and Wild Mages. Fixed version, based on [original by JOG](http://mods.jo-ge.net/bg/shaper.htm).
It's designed for BG series. It might work on other IE games, but that's untested.

- Components
  - [New wild magic spells](#new-wild-magic-spells)
  - [Retain Rhialto's inventory](#retain-rhialtos-inventory)
  - [Spellshaper kit](#spellshaper-kit)
  - [Misc spell changes](#misc-spell-changes)
- [Tips](#tips)
- [Changelog](docs/changelog.md)
- [License](docs/license.md)

### New wild magic spells
- [Ironman](#ironman)
- [Haugthy pansy](#haugthy-pansy)

This component features 27 new wild magic spells and an unique cast-once spell. See [SPELLS.PDF](wildmage/docs/spells.pdf) for detailed description.

You will meet a wild mage and gain access to his spellbook, from which you will be able to learn one spell per level of experience. If there are no wild mages in your party then the mod ends at this point. You can sell the spellbook - only wild mages can use it.

#### Ironman
On Ironman, to meet the mage, rest outdoors. You can also rest in an inn and leave the inn right thereafter.

#### Haugthy pansy
On haugthy pansy (available in BG1 only), the mage will be waiting outside Candlekeep's walls.

### Retain Rhialto's inventory
Certain items are available to the player only if Rhialto is killed fast enough. This component removes that restriction and lets you have all the loot (which might be cheaty/overpowered, depending on your taste).

### Spellshaper kit
- [Original avatar](#original-avatar)
- [Changed avatar](#changed-avatar)

A Spellshaper can't rely as much on his magic as a wizard - his spellcasting abilities are comparable to those of a bard, and his spellweaving ability might backfire. He has a wide selection of spells (some of them not even accessible to a wizard or standard wild mage) but can't cast them very often. In exchange the Spellshaper has combat abilities comparable to a rogue, and more often than not solves "problems" by mundane means, saving his magic as a last-resort tool.

All in all, the spellshaper is a heedless opportunist, to whom magic is a powerful but unreliable tool - no more and no less valuable than a good melee weapon. Imagine Elric fighting with two daggers instead of a great sword and you know the base concept of the Spellshaper class. See [SPELLSHAPER.PDF](wildmage/docs/spellshaper.pdf) for more details.

There are two ways to become a Spellshaper:

1. When the protagonist is a non-lawful Wild Mage, he'll have the chance to become a Spellshaper in the midst of combat, when he gets badly hurt.
2. Lawful protagonists and other party members need to study Rhialto's spellbook. One of the spells - "Rhialto's Chaos Conduit" forces the same changes upon the caster, that happen spontaneously to a non-lawful protagonist.

The Spellshaper is meant to be a kind of "rogueish" mage (or a "magey" rogue) as opposed to the standard "robe & pointy hat" fantasy wizard. The mage-avatar isn't fitting for this character (at least not for the Spellshaper I'm playing). So, you have an option to change it:

#### Original avatar
The Spellshaper will look like a regular mage.

#### Changed avatar
- Female Spellshapers use the Thief avatar
- Male Spellshapers use the Cleric avatar

### Misc spell changes
This component is independent of the other components, and modifies some of the original spells:

#### Magic Missiles
The missiles now always do 1d4+1 points of damage, as they're supposed to. Originally it was 2d2 at level 3-8 and 2d2+1 at levels 1,2 and 9+.

#### Dimension Door
Like dozens of other wizards in the game, you now can target any nearby place you've already visited. There no longer needs to be a clear path within the caster's viewing distance that leads to the destination-area. You can select any place within the area where you've been already. (This component doesn't include scrolls to learn the spell, if you don't play a spellshaper you need another mod, or use Shadowkeeper to learn the spell or get the scroll).

### Report issues
- Check [not bugs/known issues](docs/known_issues.md).
- Check [reported issues](https://github.com/BGforgeNet/bg2-wildmage/issues?utf8=%E2%9C%93&q=is%3Aissue).
- If it's not present there, file a new one.
